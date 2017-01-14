class AddUserIdToProblemStatement < ActiveRecord::Migration
  def change
    add_column :problem_statements, :user_id, :integer
  end
end
