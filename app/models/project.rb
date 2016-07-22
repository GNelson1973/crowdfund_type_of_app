class Project < ActiveRecord::Base

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
