class Course < ActiveRecord::Base
  has_enumeration_for :status, with: Status, create_helpers: true

  validates :name, presence: true, length: { maximum: 45 }
  validates :description, presence: true, length: { maximum: 45 }
  validates :status, presence: true, numericality: { less_than_or_equal_to: 1 }
end
