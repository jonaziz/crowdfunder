class Pledge < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :project
  belongs_to :user

  attr_accessible :amount

	validates :user, presence: true
	validates :project, presence: true
	validates :amount, numericality: {greater_than: 0}

end
