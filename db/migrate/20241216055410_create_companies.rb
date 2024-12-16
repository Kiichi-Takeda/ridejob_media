class CreateCompanies < ActiveRecord::Migration[8.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :logo
      t.string :address
      t.string :contact_number
      t.string :website

      t.timestamps
    end
  end
end
