class CreateBlockPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :block_photos do |t|
      t.string :photo

      t.timestamps
    end
  end
end
