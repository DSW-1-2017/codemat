class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.belongs_to :user, index: true
      t.boolean :active, default: true
      t.text :message
      t.string :link
      t.timestamps
    end
  end
end
