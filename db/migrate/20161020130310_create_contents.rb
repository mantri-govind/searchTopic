class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :title
      t.string :description
      t.string :attachment
      t.string :tags
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
