class DeviseCreateUsers < ActiveRecord::Migration

  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :email, null: false
      t.string :encrypted_password, null: false
      t.string :auth_token, null: false

      t.string :uid, null: false
      t.integer :role, null: false

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :uid, unique: true
    add_index :users, :auth_token, unique: true
  end
end
