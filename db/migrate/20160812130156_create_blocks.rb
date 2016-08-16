class CreateBlocks < ActiveRecord::Migration[5.0]
  def change
    create_table :blocks do |t|
      t.string :name
      t.integer :position
      t.references :lecture, index: true
      t.references :blockable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
