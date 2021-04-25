class CreateCatagories < ActiveRecord::Migration[6.1]
  def change
    create_table :catagories do |t|
      t.string :catagory
      t.integer :user_id

      t.timestamps
    end
  end
end
