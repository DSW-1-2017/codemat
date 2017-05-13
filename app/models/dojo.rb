class Dojo < ApplicationRecord
  belongs_to :user
  self.inheritance_column = 'category'

  scope :katas, -> { where(category: 'Kata') }
  scope :randoris, -> { where(category: 'Randori') }

  has_one :location
  has_one :video

  def self.categories
    %w(Kata Randori)
  end

end
