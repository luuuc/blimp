class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages, id: :uuid do |t|
      t.string :messageable_type, null: false, limit: 50
      t.uuid   :messageable_id,   null: false
      t.uuid   :user_id,          null: false
      t.string :type,             null: false, limit: 50
      t.string :body
      t.hstore :data

      t.timestamps
    end

    add_index :messages, :user_id
    add_index :messages, [:type, :messageable_type, :messageable_id]
  end
end
