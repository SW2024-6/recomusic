class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.string :title
      t.text :body
      t.integer :my_difficulty
      t.integer :user_id
      t.integer :music_id

      t.timestamps
    end
  end
end
