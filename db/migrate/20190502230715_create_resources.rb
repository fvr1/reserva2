class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.string :name
      t.text :details
      t.string :category

      t.timestamps
    end
  end
end
