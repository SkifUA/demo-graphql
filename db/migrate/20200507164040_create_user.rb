class CreateUser < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, limit: 127, null: false, index: true
      t.string :name, limit: 127
      t.string :password_digest, limit: 64
      t.text :fb_token, index: true
      t.string :fb_id, limit: 32
      t.string :jti, limit: 64

      t.timestamps
    end
  end
end
