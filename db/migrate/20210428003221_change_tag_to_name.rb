class ChangeTagToName < ActiveRecord::Migration[6.1]
  def change
    rename_column :tags, :tag, :name
  end
end
