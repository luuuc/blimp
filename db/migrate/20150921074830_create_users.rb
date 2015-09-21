class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: :uuid do |t|
      t.string :slug,             null: false
      t.string :username,         null: false
      t.string :email,            null: false
      t.string :password_digest,  null: false
      t.string :avatar

      t.timestamps
    end

    add_index :users, :slug, unique: true
    add_index :users, :email, unique: true
  end
end
