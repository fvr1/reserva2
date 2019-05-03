class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
      t.integer :category
      t.date :date
      t.belongs_to :resource
      t.belongs_to :block

      t.timestamps
    end
  end
end
