class Pledge < ActiveRecord::Base
  attr_accessible :amount

  validates :amount, :presence => true, numericality: {greater_than: 0}
  validates :user_id, :presence => true
  validates :project_id, :presence => true

  belongs_to :user
  belongs_to :project

end
