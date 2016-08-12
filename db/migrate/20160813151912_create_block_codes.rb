class CreateBlockCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :block_codes do |t|
      t.string :language, limit: 255
      t.text :content, limit: 4_294_967_295

      t.timestamps
    end
  end
end
