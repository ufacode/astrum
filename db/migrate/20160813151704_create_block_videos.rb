class CreateBlockVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :block_videos do |t|
      t.string :video

      t.timestamps
    end
  end
end
