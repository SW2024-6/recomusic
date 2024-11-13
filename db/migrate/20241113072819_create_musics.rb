class CreateMusics < ActiveRecord::Migration[7.1]
  def change
    create_table :musics do |t|
      t.string :title
      t.string :artist
      t.integer :difficulty
      t.string :genre

      t.timestamps
    end
  end
end
