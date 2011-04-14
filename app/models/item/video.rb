class Item::Video < Asset
  has_attached_file :attachment
#  process_in_background :attachment
=begin
  :mov        => {:size => '320x240', :format => 'mov'},
  :avi        => {:size => '320x240', :format => 'avi'},
  :thumbnail  => {:size => '150x100', :format => 'jpg', 
    :disable_audio => true, :rate => 1, :video_frames => 1, :force_format => 'image2'}
},

, :styles => {
        :avi => {:size => '100x100', :format => 'avi'},
        :thumbnail  => {:size => '150x100', :format => 'jpg', 
          :disable_audio => true, :rate => 1, :video_frames => 1, :force_format => 'image2'}
      
},
      :processors => [:transcode]

=end 
end