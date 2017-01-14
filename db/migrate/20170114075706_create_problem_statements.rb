class CreateProblemStatements < ActiveRecord::Migration
  def change
    create_table :problem_statements do |t|
      t.string :name
      t.string :description
      t.string :tags
      t.string :attachment
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps null: false
    end
  end
end
