namespace :js do
  desc "Minify javascript src for production environment"
  task :min => :environment do
    # list of files to minify
    libs = ["public/javascripts/jquery.nivo.slider.js", "public/javascripts/imageflow/imageflow.js", "public/javascripts/thickbox/thickbox.js", "public/javascripts/fenix.js", "public/javascripts/jquery.showpassword.js", "public/javascripts/jquery.easing.1.3.js", 
    "public/javascripts/jquery.easing.compatibility.js", "public/javascripts/jquery.datepicker.js"]
 
    # paths to jsmin script and final minified file
    jsmin = 'script/jsmin.rb'
    final = 'public/javascripts/all_min.js'
 
    # create single tmp js file
    tmp = Tempfile.open('all')
    libs.each {|lib| open(lib) {|f| tmp.write(f.read) } }
    tmp.rewind
 
    # minify file
    %x[ruby #{jsmin} < #{tmp.path} > #{final}]
    puts "\n#{final}"
  end
end