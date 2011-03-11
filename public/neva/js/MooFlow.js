var MooFlow = new Class(
{
    Implements : [Events, Options], options : 
    {
        onStart : $empty, onClickView : $empty, onAutoPlay : $empty, onAutoStop : $empty, onRequest : $empty, 
        onResized : $empty, onEmptyinit : $empty, reflection : 0, heightRatio : 0.32, offsetY : 0, startIndex : 0, 
        interval : 3000, factor : 115, bgColor : '#FBFAF6', useCaption : true, useResize : false, useSlider : false, 
        useWindowResize : false, useMouseWheel : true, useKeyInput : false, useViewer : true
    },
    initialize : function (element, options)
    {
        this.MooFlow = element;
        this.setOptions(options);
        this.foc = 150;
        this.limit = 3;
        this.factor = this.options.factor;
        this.offY = this.options.offsetY;
        this.isFull = false;
        this.isAutoPlay = false;
        this.isLoading = false;
        this.inMotion = false;
        var height = this.MooFlow.getSize().x * this.options.heightRatio;
        this.MooFlow.addClass('mf').setStyles(
        {
            'overflow' : 'hidden', 'background-color' : this.options.bgColor, 'position' : 'relative', 
            'align' : 'center', 'height' : height, 'opacity' : 0
        });
        var t;
        window.addEvent('resize', function (e)
        {
            if (t) {
                $clear(t);
            }
            function resize()
            {
                this.MooFlow.setStyle('height', height); this.MooFlow.empty();
                this.createAniObj();
            }
            t = resize.delay(1000, this);
        }
        .bind(this));
        this.MooFlow.addEvent('mousewheel', this.wheelTo.bind(this));
        document.addEvent('keydown', this.keyTo.bind(this));
        $(element.id + '-left').addEvent('click', function (e)
        {
            e.stop();
            this.prev();
        }
        .bind(this));
        $(element.id + '-right').addEvent('click', function (e)
        {
            e.stop();
            this.next();
        }
        .bind(this));
        this.getElements(this.MooFlow);
    },
    clearInit : function ()
    {
        this.fireEvent('emptyinit');
    },
    getElements : function (el)
    {
        this.master = {
            'images' : []
        };
        var els = el.getChildren();
        if (!els.length) {
            this.clearInit();
            return;
        }
        $$(els).each(function (el)
        {
            var hash = $H(el.getElement('img').getProperties('src', 'title'));
            if (el.get('tag') == 'a') {
                hash.combine(el.getProperties('href'));
            }
            this.master['images'].push(hash);
        }, this);
        this.clearMain();
    },
    clearMain : function ()
    {
        if (this.cap) {
            this.cap.fade(0);
        }
        this.MooFlow.empty();
        this.createAniObj();
    },
    getMooFlowElements : function (key)
    {
        var els = [];
        this.master.images.each(function (el)
        {
            els.push(el[key]);
        });
        return els;
    },
    createAniObj : function ()
    {
        this.aniFx = new Fx.Value(
        {
            'transition' : Fx.Transitions.Expo.easeOut, 'link' : 'cancel', 'duration' : 750, onMotion : this.process.bind(this), 
            'onStart' : this.flowStart.bind(this), 'onComplete' : this.flowComplete.bind(this)
        });
        this.addLoader();
    },
    addLoader : function ()
    {
        this.MooFlow.store('height', this.MooFlow.getSize().y);
        this.loader = new Element('div', {
            'class' : 'loader'
        }).inject(this.MooFlow);
        new Fx.Tween(this.MooFlow, {
            'duration' : 800, 'onComplete' : this.preloadImg.bind(this)
        }).start('opacity', 1);
    },
    preloadImg : function ()
    {
        this.loadedImages = new Asset.images(this.getMooFlowElements('src'), 
        {
            'onComplete' : this.loaded.bind(this), 'onProgress' : this.createMooFlowElement.bind(this)
        });
    },
    createMooFlowElement : function (counter, i)
    {
        var obj = this.getCurrent(i);
        var img = this.loadedImages[i];
        obj['width'] = img.width;
        obj['height'] = img.height;
        img.removeProperties('width', 'height');
        obj['div'] = new Element('div').setStyles({
            'position' : 'absolute', 'display' : 'none', 'height' : this.MooFlow.getSize().y
        }).inject(this.MooFlow);
        obj['con'] = new Element('div').inject(obj['div']);
        img.setStyles({
            'vertical-align' : 'bottom', 'width' : '100%', 'height' : '50%'
        });
        img.setStyle('behavior', 'url(/css/iepngfix.htc)'); img.setStyle('cursor', 'pointer'); img.addEvents({
            'click' : this.clickTo.bind(this, i), 'dblclick' : this.viewCallBack.bind(this, i)
        });
        img.inject(obj['con']);
        this.loader.set('text', (counter + 1) + ' / ' + this.loadedImages.length);
    },
    loaded : function ()
    {
        this.index = this.options.startIndex;
        this.iL = this.master.images.length - 1;
        new Fx.Tween(this.loader, {
            'duration' : 800, 'onComplete' : this.createUI.bind(this)
        }).start('opacity', 0);
    },
    createUI : function ()
    {
        this.loader.dispose();
        if (this.options.useCaption)
        {
            if (this.cap) {
                this.cap.destroy();
            }
            this.cap = new Element('div').addClass('caption').set('opacity', 0).inject(this.MooFlow);
        }
        this.nav = new Element('div').addClass('mfNav').setStyle('bottom', '-50px');
        this.autoPlayCon = new Element('div').addClass('autoPlayCon');
        this.sliderCon = new Element('div').addClass('sliderCon');
        this.resizeCon = new Element('div').addClass('resizeCon');
        if (this.options.useAutoPlay)
        {
            this.autoPlayCon.adopt(new Element('a', {
                'class' : 'stop', 'events' : {
                    'click' : this.stop.bind(this)
                }
            }), new Element('a', {
                'class' : 'play', 'events' : {
                    'click' : this.play.bind(this)
                }
            }));
        }
        if (this.options.useSlider)
        {
            this.sliPrev = new Element('a', {
                'class' : 'sliderNext', 'events' : {
                    'click' : this.prev.bind(this)
                }
            });
            this.sliNext = new Element('a', {
                'class' : 'sliderPrev', 'events' : {
                    'click' : this.next.bind(this)
                }
            });
            this.knob = new Element('div', {
                'class' : 'knob'
            });
            this.knob.adopt(new Element('div', {
                'class' : 'knobleft'
            }));
            this.slider = new Element('div', {
                'class' : 'slider'
            }).adopt(this.knob);
            this.sliderCon.adopt(this.sliPrev, this.slider, this.sliNext);
            this.slider.store('parentWidth', this.sliderCon.getSize().x - this.sliPrev.getSize().x - this.sliNext.getSize().x);
        }
        if (this.options.useResize)
        {
            this.resizeCon.adopt(new Element('a', {
                'class' : 'resize', 'events' : {
                    'click' : this.setScreen.bind(this)
                }
            }));
        }
        this.MooFlow.adopt(this.nav.adopt(this.autoPlayCon, this.sliderCon, this.resizeCon));
        this.showUI();
    },
    showUI : function ()
    {
        if (this.cap) {
            this.cap.fade(1);
        }
        this.nav.tween('bottom', 20);
        this.fireEvent('start');
        this.update();
    },
    update : function (e)
    {
        if (e == 'init') {
            return;
        }
        this.oW = this.MooFlow.getSize().x;
        this.sz = this.oW * 0.5;
        if (this.options.useSlider)
        {
            this.slider.setStyle('width', this.slider.getParent().getSize().x - this.sliPrev.getSize().x - this.sliNext.getSize().x - 1);
            this.knob.setStyle('width', (this.slider.getSize().x / this.iL));
            this.sli = new SliderEx(this.slider, this.knob, {
                steps : this.iL
            }).set(this.index);
            this.sli.addEvent('onChange', this.glideTo.bind(this));
        }
        this.glideTo(this.index);
        this.isLoading = false;
    },
    setScreen : function ()
    {
        if (this.isFull = !this.isFull)
        {
            this.holder = new Element('div').inject(this.MooFlow, 'after');
            this.MooFlow.wraps(new Element('div').inject(document.body));
            this.MooFlow.setStyles(
            {
                'position' : 'absolute', 'z-index' : '100', 'top' : '0', 'left' : '0', 'width' : window.getSize().x, 
                'height' : window.getSize().y
            });
            if (this.options.useWindowResize)
            {
                this._initResize = this.initResize.bind(this);
                window.addEvent('resize', this._initResize);
            }
        }
        else
        {
            this.MooFlow.wraps(this.holder);
            window.removeEvent('resize', this._initResize);
            delete this.holder, this._initResize;
            this.MooFlow.setStyles(
            {
                'position' : 'relative', 'z-index' : '', 'top' : '', 'left' : '', 'width' : '', 'height' : this.MooFlow.retrieve('height')
            });
            this.slider.setStyle('width', this.slider.retrieve('parentWidth'));
        }
        this.fireEvent('resized', this.isFull);
        this.update();
    },
    initResize : function ()
    {
        this.MooFlow.setStyles({
            'width' : window.getSize().x, 'height' : window.getSize().y
        });
        this.update();
    },
    getCurrent : function (index)
    {
        var len = this.master.images.length;
        index = index % len;
        return this.master.images[$chk(index) ? index : this.index % len];
    },
    loadJSON : function (url)
    {
        if (!url || this.isLoading) {
            return;
        }
        this.isLoading = true;
        new Request.JSON(
        {
            'onComplete' : function (data)
            {
                if ($chk(data)) {
                    this.master = data;
                    this.clearMain();
                    this.fireEvent('request', data);
                }
            }
            .bind(this)
        }, this).get(url);
    },
    loadHTML : function (url, filter)
    {
        if (!url || !filter || this.isLoading) {
            return;
        }
        this.isLoading = true;
        new Request.HTML(
        {
            'onSuccess' : function (tree, els, htm)
            {
                var result = new Element('div', {
                    'html' : htm
                }).getChildren(filter);
                this.getElements(result);
                this.fireEvent('request', result);
            }
            .bind(this)
        }, this).get(url);
    },
    flowStart : function ()
    {
        this.inMotion = true;
    },
    flowComplete : function ()
    {
        this.inMotion = false;
    },
    viewCallBack : function (index)
    {
        if (this.index != index || this.inMotion) {
            return;
        }
        var el = $H(this.getCurrent());
        var returnObj = {};
        returnObj['coords'] = el.div.getElement('img').getCoordinates();
        el.each(function (v, k)
        {
            if ($type(v) == 'number' || $type(v) == 'string') {
                returnObj[k] = v;
            }
        }, this);
        this.fireEvent('clickView', returnObj);
    },
    prev : function ()
    {
        if (this.index > 0 || this.master.images.length >= this.limit * 2) {
            this.clickTo(this.index - 1);
        }
    },
    next : function ()
    {
        if (this.index < this.iL || this.master.images.length >= this.limit * 2) {
            this.clickTo(this.index + 1);
        }
    },
    stop : function ()
    {
        $clear(this.autoPlay);
        this.isAutoPlay = false;
        this.fireEvent('autoStop');
    },
    play : function ()
    {
        this.autoPlay = this.auto.periodical(this.options.interval, this);
        this.isAutoPlay = true;
        this.fireEvent('autoPlay');
    },
    auto : function ()
    {
        if (this.index < this.iL) {
            this.next();
        }
        else if (this.index == this.iL) {
            this.clickTo(0);
        }
    },
    keyTo : function (e)
    {
        switch (e.code) {
            case 37:
                e.stop();
                this.prev();
                break;
            case 39:
                e.stop();
                this.next();
        }
    },
    wheelTo : function (e)
    {
        if (!this.inMotion) {
            if (e.wheel > 0) {
                this.next();
            }
            if (e.wheel < 0) {
                this.prev();
            }
        }
        e.stop().preventDefault();
    },
    clickTo : function (index)
    {
        if (this.index == index) {
            this.viewCallBack(index);
        }
        if (index < 0) {
            index += this.master.images.length;
        }
        if (index > this.master.images.length) {
            index -= this.master.images.length;
        }
        if (this.sli) {
            this.sli.set(index);
        }
        this.glideTo(index);
    },
    glideTo : function (index)
    {
        var value = this.aniFx.get();
        var icount = this.master.images.length;
        if (icount >= this.limit * 2)
        {
            with (Math)
            {
                var xlen = icount * this.foc;
                var zero_value = round(value / xlen) * xlen;
                var right_value = zero_value - index * this.foc;
                var left_value = xlen + zero_value - index * this.foc;
                var to = abs(value - right_value) > abs(value - left_value) ? left_value : right_value;
            }
        }
        else {
            var to = index *- this.foc;
        }
        this.index = index;
        this.aniFx.start(value, to);
        if (this.cap) {
            this.cap.set('html', this.getCurrent(index % icount).title);
        }
    },
    process : function (x)
    {
        var icount = this.master.images.length;
        var xlen = icount * this.foc;
        var limit = this.limit, foc = this.foc;
        var div, index;
        var circle = icount >= this.limit * 2; this.master.images.each(function (el, index)
        {
            x = x % xlen;
            if (!el.div) {
                return;
            }
            div = el.div.style;
            if (x > -foc * limit && x < foc * limit) {
                this._process(x, el);
                div.display = 'block';
            }
            else if (circle && (x - xlen) > -foc * limit && (x - xlen) < foc * limit) {
                this._process(x - xlen, el);
                div.display = 'block';
            }
            else if (circle && (x + xlen) > -foc * limit && (x + xlen) < foc * limit) {
                this._process(x + xlen, el);
                div.display = 'block';
            }
            else {
                div.display = 'none';
            }
            x += foc;
        }
        .bind(this));
    },
    _process : function (x, el)
    {
        var z, W, H, foc = this.foc, f = this.factor;
        var sz = this.sz, oW = this.oW, offY = this.offY;
        var elw = el.width;
        var elh = el.height;
        var div = el.div.style;
        var zI = this.iL;
        var zindex = x > 0 ? parseInt(zI + 1000 - x) : parseInt(zI + 1000 + x);
        div.zIndex = zindex;
        with (Math)
        {
            z = sqrt(10000 + x * x) + 100;
            H = round((elh / elw * f) / z * sz);
            W = round(elw * H / elh);
            if (H >= elw * 0.5) {
                W = round(f / z * sz);
            }
            div.left = round(((x / z * sz) + sz) - (f * 0.5) / z * sz) + 'px';
            div.top = round((oW * 0.25 - H) / 2) + offY + 'px';
        }
        el.con.style.height = H * 2 + 'px';
        div.width = W + 'px';
    }
});