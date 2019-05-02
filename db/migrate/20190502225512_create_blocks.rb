class CreateBlocks < ActiveRecord::Migration[5.2]
  def change
    create_table :blocks do |t|
      t.time :start_time
      t.time :end_time
      t.integer :day

      t.timestamps
    end
  end
end
