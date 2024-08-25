class CreateRecipients < ActiveRecord::Migration[7.1]
  def change
    create_table :recipients do |t|
      t.string :document
      t.string :name
      t.string :address
      t.string :address_number
      t.string :address_complement
      t.string :city
      t.string :state
      t.string :country
      t.string :cep
      t.string :phone

      t.timestamps
    end
  end
end
