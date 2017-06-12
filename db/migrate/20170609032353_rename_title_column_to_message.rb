class RenameTitleColumnToMessage < ActiveRecord::Migration[5.0]
  def change
    rename_column :messages, :image, :avatar
  end
end
