class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :mail
      t.string :phone
      t.string :adress
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end