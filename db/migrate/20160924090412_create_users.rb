class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid, uniq: true, index: true, null: false
      t.string :email, uniq: true, index: true, null: false
      t.string :password, null: false
      t.string :role, null: false

      t.timestamps null: false
    end
  end
end
