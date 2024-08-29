class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :ncm
      t.string :cfop
      t.string :unit_com
      t.decimal :quantity_com, precision: 10, scale: 2
      t.decimal :total_amount, precision: 10, scale: 2
      t.decimal :icms, precision: 15, scale: 2
      t.decimal :ipi, precision: 15, scale: 2
      t.decimal :pis, precision: 15, scale: 2
      t.decimal :cofins, precision: 15, scale: 2
      t.references :invoice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
