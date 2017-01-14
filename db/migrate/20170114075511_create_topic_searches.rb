class CreateTopicSearches < ActiveRecord::Migration
  def change
    create_table :topic_searches do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
