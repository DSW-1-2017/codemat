class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.belongs_to :user, index: true
      t.belongs_to :dojo, index: true

      t.timestamps
    end
  end
end
