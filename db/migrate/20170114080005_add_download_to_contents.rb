class AddDownloadToContents < ActiveRecord::Migration
  def change
    add_column :contents, :download, :integer
  end
end
