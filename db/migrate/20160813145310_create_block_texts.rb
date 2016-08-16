class CreateBlockTexts < ActiveRecord::Migration[5.0]
  def change
    create_table :block_texts do |t|
      t.text :content, limit: 4_294_967_295

      t.timestamps
    end
  end
end
