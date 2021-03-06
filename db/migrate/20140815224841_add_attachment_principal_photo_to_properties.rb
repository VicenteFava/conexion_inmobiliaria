class AddAttachmentPrincipalPhotoToProperties < ActiveRecord::Migration
  def self.up
    change_table :properties do |t|
      t.attachment :principal_photo
    end
  end

  def self.down
    remove_attachment :properties, :principal_photo
  end
end
