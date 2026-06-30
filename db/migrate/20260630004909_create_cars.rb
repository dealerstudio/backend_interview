class CreateCars < ActiveRecord::Migration[8.0]
  def change
    create_table :cars do |t|
      t.string     :make
      t.string     :model
      t.integer    :year
      t.decimal    :price,  precision: 10, scale: 2
      t.string     :status, default: "available"
      t.string     :vin
      t.references :dealership, null: false, foreign_key: true

      t.timestamps
    end
  end
end
