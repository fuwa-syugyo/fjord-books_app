class ChangeCommentsColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :report_id, :integer
    add_column :comments, :commentable_type, :string
    add_column :comments, :commentable_id, :integer
  end
end
