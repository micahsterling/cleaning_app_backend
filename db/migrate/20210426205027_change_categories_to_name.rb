class ChangeCategoriesToName < ActiveRecord::Migration[6.1]
  def change
    rename_column :categories, :category, :name
  end
end
