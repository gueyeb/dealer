class AddDirectUploadToImage < ActiveRecord::Migration
  def change
    add_column :images, :direct_upload_url, :string, null: false
    add_column :images, :processed, :boolean, default: false, null: false
  end
end
