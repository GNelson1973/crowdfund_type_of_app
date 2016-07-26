class Project < ActiveRecord::Base

  validates :name, :website, :team_members, presence: true
  validates :description, length: {minimum: 20}
  validates :target_pledge_amount, numericality: {greater_than_or_equal_to: 0,  message: "%{value}must be greater than zero." }
  validates :image_file_name, allow_blank: true, format: {
    with: /\w+|.(gif|jpg|png)\z/i,
    message: "must reference a GIF, JPG, or PNG image"
  }

  validates :pledging_ends_on,
    date: { after: Proc.new { Date.today }, message: 'must be after today' }


  has_many :pledges, dependent: :destroy #destroys all pledges when project is destroyed

  def expired?
     pledging_ends_on.past?
  end

  def blank?
    pledging_ends_on.blank?
  end

  def more_29_days?
    end_date = pledging_ends_on
    start_date = Time.now
    ( end_date.to_date - start_date.to_date ).to_i > 29
  end

  def self.actual
    where("pledging_ends_on >= ?", Time.now).order(pledging_ends_on: :asc)
  end

end
