class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups, id: :uuid do |t|
      t.string :slug, null: false
      t.string :name, null: false

      t.timestamps
    end

    add_index :groups, :slug, unique: true
  end
end
