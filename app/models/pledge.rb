class Pledge < ActiveRecord::Base

  validates :name, presence: true

  validates :email, format: { with: /(\S+)@(\S+)/ }

  pledge_amount_options = [
    5, 10, 15, 25, 50, 100, 200, 500
  ]

  validates :pledge_amount, inclusion: { in: pledge_amount_options }

  belongs_to :project
end
