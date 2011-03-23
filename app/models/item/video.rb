class Item::Video < Asset
  has_attached_file :attachment, #:styles => {
#          :flv        => {:size => '320x240', :format => 'flv'},
#},
#        :processors => [:transcode]
=begin
  :mov        => {:size => '320x240', :format => 'mov'},
  :avi        => {:size => '320x240', :format => 'avi'},
  :thumbnail  => {:size => '150x100', :format => 'jpg', 
    :disable_audio => true, :rate => 1, :video_frames => 1, :force_format => 'image2'}
},
=end 
end