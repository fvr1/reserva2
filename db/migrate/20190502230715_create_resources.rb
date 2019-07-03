class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.string :name
      t.text :details
      t.string :category
      t.belongs_to :company

      t.timestamps
    end
  end
end
