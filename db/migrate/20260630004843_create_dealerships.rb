class CreateDealerships < ActiveRecord::Migration[8.0]
  def change
    create_table :dealerships do |t|
      t.string  :name,   null: false
      t.string  :slug
      t.string  :city
      t.boolean :active, default: true, null: false

      t.timestamps
    end
  end
end
