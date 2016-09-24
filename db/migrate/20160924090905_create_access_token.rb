class CreateAccessToken < ActiveRecord::Migration
  def change
    create_table :access_tokens do |t|
      t.string :token, index: true, uniq: true, null: false
      t.boolean :revoked, null: false, default: false
      t.references :user, null: false, index: true

      t.timestamps null: false
    end
  end
end
