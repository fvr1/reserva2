class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.string :mail
      t.string :phone
      t.string :name
      t.text :comment
      t.integer :status
      t.belongs_to :state

      t.timestamps
    end
  end
end
