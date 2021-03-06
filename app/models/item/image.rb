class Item::Image < Asset
  has_attached_file :attachment, :styles => {:thumb => "128x80#", :normal => "400x300", :masked => ["128x80#", :png]}
  after_save :mask
  
  #def masked_url
  #  self.attachment.url(:thumb)+".png"
  #end
  
  def mask

#    cmd = self.attachment.path(:thumb)+' '+Rails.root.to_s+
#        '/public/images/mask.png'+' -alpha Off -compose Copy_Opacity -composite '+self.attachment.path(:thumb)
    if self.attachment && self.attachment.path(:masked) && File::exists?(self.attachment.path(:masked))
      cmd = "'#{self.attachment.path(:masked)}'" + ' -alpha set -gravity center -extent 135x80'
      cmd += ' '+"'"+Rails.root.to_s+'/public/images/mask2.png'+"'"+' -compose DstIn -composite '
      cmd += "'"+self.attachment.path(:masked)+"'"
#    logger.info cmd
#    puts cmd
      begin
      Paperclip.run 'convert', cmd
      rescue
      end
    end
  end
end
#/Users/macuser/Project/yahtus/public/system/attachments/2/thumb/grand_ext_4.jpg -alpha set -gravity center -extent 128x80 /Users/macuser/Project/yahtus/public/images/mask.png -compose DstIn -composite /Users/macuser/Project/yahtus/public/system/attachments/2/thumb/grand_ext_4.jpg
#/Users/macuser/Project/yahtus/public/system/attachments/2/thumb/grand_ext_4.jpg -alpha set -gravity center -extent 135x73 /Users/macuser/Project/yahtus/public/images/mask.png -compose DstIn -composite /Users/macuser/Project/yahtus/public/system/attachments/2/thumb/grand_ext_4.jpg

#/Users/macuser/Project/yahtus/public/system/attachments/2/thumb/grand_ext_4.jpg -alpha set -gravity center -extent 135x73 /Users/macuser/Project/yahtus/public/images/mask.png /Users/macuser/Project/yahtus/public/system/attachments/2/thumb/grand_ext_4.jpg


#public/system/attachments/2/thumb/grand_ext_4.jpg  -gravity center -extent 135x73 public/images/mask.png -compose DstIn -composite public/system/attachments/2/thumb/grand_ext_5.jpg

#public/system/attachments/2/thumb/grand_ext_4.jpg -extent 135x80 -alpha set -gravity center  ~/border_ellipse_mask.png -compose DstIn -composite public/system/attachments/2/thumb/grand_ext_5.png
