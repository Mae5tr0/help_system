class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :uid, uniq: true, index: true, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.string :status, null: false
      t.references :user, null: false, index: true

      t.timestamps null: false
    end
  end
end
