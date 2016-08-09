class AddIndexAndLimitToCourse < ActiveRecord::Migration[5.0]
  def change
    add_index :courses, :aasm_state
    reversible do |dir|
      dir.up do
        change_column :courses, :aasm_state, :string, limit:16
      end
      dir.down do
        change_column :courses, :aasm_state, :string, limit:255
      end
    end
  end
end
