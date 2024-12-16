class CreateJobs < ActiveRecord::Migration[8.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :salary
      t.string :location
      t.string :employment_type
      t.string :contact_info
      t.datetime :posted_at
      t.datetime :expires_at
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
