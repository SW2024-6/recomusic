class CreateLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :links do |t|
      t.integer :music_id
      t.string :video_url
      t.string :score_url

      t.timestamps
    end
  end
end
