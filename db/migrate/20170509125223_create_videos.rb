class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :source
      t.belongs_to :dojo, index: true
      t.timestamps
    end
  end
end
