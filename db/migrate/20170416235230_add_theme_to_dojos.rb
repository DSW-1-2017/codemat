class AddThemeToDojos < ActiveRecord::Migration[5.1]
  def change
    add_reference :dojos, :theme, foreign_key: true
  end
end
