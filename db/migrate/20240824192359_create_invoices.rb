class CreateInvoices < ActiveRecord::Migration[7.1]
  def change
    create_table :invoices do |t|
      t.string :serie
      t.string :invoice_number
      t.datetime :invoice_date
      t.references :sender, null: false, foreign_key: true
      t.references :recipient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
