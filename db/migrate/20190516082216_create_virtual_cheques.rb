class CreateVirtualCheques < ActiveRecord::Migration[5.2]
  def change
    create_table :virtual_cheques do |t|
      t.string :recipient_name, null: false
      t.date :date, null: false
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.string :amount_in_words

      t.timestamps
    end
  end
end
