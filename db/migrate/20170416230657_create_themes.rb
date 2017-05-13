class CreateThemes < ActiveRecord::Migration[5.1]
  def change
    create_table :themes do |t|
    	t.string :name
      	t.string :icon_name
      	t.string :theme_background
      t.timestamps
    end
  end
end
