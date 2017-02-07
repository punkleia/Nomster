class AlterCommentsAddCommentId < ActiveRecord::Migration
  def change
    add_column :comments, :comment_id, :integer
    add_index :comments, :user_id
  end
end
