class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :text
      t.stiring :image
      t.integer :user_id null: false,foreign_key :true, add_index
      t.integer :group_id null: false,foreign_key :true, add_index
      t.timestamps null: false
    end
  end
end
