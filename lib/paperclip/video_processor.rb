# = Video Conversion Processor
# This is a video processor module for Paperclip (http://thoughtbot.com/projects/paperclip) that uses
# FFMpeg to convert uploaded videos to the format specified in the processor options. 
# 
# Because video processing takes a long time, it's recommended that this processor not be used synchronously.
# Instead, use it asynchronously by returning false in the applicable model for the before_post_process callback
# and then use a queue or a daemon to process new videos. 
#
# ---
#
# This processor takes the following options:
#   [audio_bitrate] Sets the audio bitrate for FFMpeg. Should be a string formatted like '64k'
#
#   [audio_codec] The codec to be used for audio. Defaults to 'aac'
#
#   [bitrate] Sets the video bitrate for FFMpeg. Should be a string formatted like '256k'
#
#   [format] The file extension to be outputted by the processor
#
#   [size] The size of the processed video. Should be a string formatted like '480x320'
#
#   [video_codec] The codec to be used for video. Defaults to 'libx264'
module Paperclip
  class VideoProcessor < Processor
    attr_accessor :audio_bitrate, :audio_codec, :bitrate, :format, :size, :video, :video_codec
    
    def initialize(file, options = { }, attachment = nil)
      super
      
      # Set options
      @aspect         = options[:size].gsub(/x/, ':') || '480:320'
      @audio_bitrate  = options[:audio_bitrate]       || '64k'
      @audio_codec    = options[:audio_codec]         || 'libfaac'
      @basename       = File.basename(file.path)
      @bitrate        = options[:bitrate]             || '256k'
      @codec          = options[:codec]               || 'libx264'
      @current_format = File.extname(file.path)
      @file           = file
      @format         = options[:format]              || 'mp4'
      @size           = options[:size]                || '480x320'
      @video          = options[:video]               || false
    end
    
    def make      
      Paperclip.options[:log_command] = true
      # Create temp file for output
      dst = Tempfile.new [@basename, @format].compact.join('.')
      dst.binmode
      
      # FFMpeg command
      unless options[:image]
        command = <<-command
          -er 4 -y -i #{File.expand_path(@file.path)} -acodec #{@audio_codec} -ar 48000 -ab #{@audio_bitrate} -s #{@size} -vcodec #{@codec} -b #{@bitrate} -flags +loop -cmp +chroma -partitions +parti4x4+partp8x8+partb8x8 -subq 5 -trellis 1 -refs 1 -coder 0 -me_range 16 -keyint_min 25 -sc_threshold 40 -i_qfactor 0.71 -bt #{@bitrate} -maxrate #{@bitrate} -bufsize #{@bitrate} -rc_eq 'blurCplx^(1-qComp)' -qcomp 0.6 -qmin 10 -qmax 51 -qdiff 4 -level 30 -aspect #{@aspect} -g 30 -ss 0 -t 90 -async 2 #{File.expand_path(dst.path)}                
        command
      else
        command = <<-command
          -i #{File.expand_path(@file.path)} -an -vcodec #{@codec} -vframes 1 -ss 10 -s #{@size} -aspect #{@aspect} #{File.expand_path(dst.path)}
        command
      end
      
      # Run command, raise error if there's a problem
      begin
        success = Paperclip.run('ffmpeg', command)
      rescue PaperclipCommandLineError
        raise PaperclipError, "There was an error converting the video #{@basename}"
      end
      
      # Return converted file
      dst
    end
  end
end