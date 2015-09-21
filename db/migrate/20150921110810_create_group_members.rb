class CreateGroupMembers < ActiveRecord::Migration
  def change
    create_table :group_members, id: :uuid do |t|
      t.uuid :group_id, null: false
      t.uuid :user_id,  null: false

      t.timestamps
    end

    add_index :group_members, [:group_id, :user_id], unique: true
  end
end
