class AddAttachmentImageToFlows < ActiveRecord::Migration
  def self.up
    change_table :flows do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :flows, :image
  end
end
