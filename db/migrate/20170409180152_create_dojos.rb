class CreateDojos < ActiveRecord::Migration[5.1]
  def change
    create_table :dojos do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.text :description
      t.datetime :starts_at
      t.datetime :ends_at
      t.integer :coding_time
      t.integer :break_time
      t.string :category
      t.timestamps
    end
  end
end
