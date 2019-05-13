class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :mail
      t.string :phone
      t.string :address
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end