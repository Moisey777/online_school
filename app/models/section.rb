class Section < ApplicationRecord
	belongs_to :course

	validates :name, presence: true
  validates :description, presence: true
  validates :course_id, presence: true

end
