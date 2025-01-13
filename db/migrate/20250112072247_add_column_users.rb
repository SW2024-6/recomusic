class AddColumnUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :comment_id, :integer
  end
end
