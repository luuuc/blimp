class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels, id: :uuid do |t|
      t.string :slug, null: false
      t.string :name, null: false

      t.timestamps
    end

    add_index :channels, :slug, unique: true
  end
end
