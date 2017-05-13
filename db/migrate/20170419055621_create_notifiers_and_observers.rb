class CreateNotifiersAndObservers < ActiveRecord::Migration[5.1]
  def change
    create_table :notifiers_observers do |t|
      t.belongs_to :theme, index: true
      t.belongs_to :user, index: true
    end
  end
end
