class Student < ActiveRecord::Base
  has_enumeration_for :status, with: Status, create_helpers: true

  has_many :classrooms
  has_many :courses, through: :classrooms

  validates :name, presence: true, length: { maximum: 45 }
  validates :register_number, presence: true, length: { maximum: 45 }
  validates :status, presence: true, numericality: { less_than_or_equal_to: 1 }
end
