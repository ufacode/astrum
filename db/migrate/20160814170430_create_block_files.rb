class CreateBlockFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :block_files do |t|
      t.string :file

      t.timestamps
    end
  end
end
