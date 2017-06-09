class ChangeNameToGroup < ActiveRecord::Migration[5.0]
  def up
  change_column :Groups, :name, :string, null: false
  end

  def down
  change_column :Groups, :name, :integer, null: false
  end
end
