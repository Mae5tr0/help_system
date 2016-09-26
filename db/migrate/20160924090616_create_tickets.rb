class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :uid, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.string :status, null: false
      t.references :user, null: false, index: true

      t.timestamps null: false
    end

    add_index :tickets, :uid, unique: true
  end
end
