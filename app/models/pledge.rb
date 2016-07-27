class Pledge < ActiveRecord::Base

  validates :name, presence: true

  validates :email, format: { with: /(\S+)@(\S+)/ }

  PLEDGE_AMOUNT_OPTIONS = [
    5, 10, 15, 25, 50, 100, 200, 500
  ]

  validates :pledge_amount, inclusion: { in: PLEDGE_AMOUNT_OPTIONS }

  belongs_to :project
end
