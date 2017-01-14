class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.string :name
      t.integer :problem_statement_id
      t.integer :user_id
      t.string :attachment
      t.string :comment

      t.timestamps null: false
    end
  end
end
