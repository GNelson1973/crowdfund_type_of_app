module ProjectsHelper

  def pledging_ends_format(project)
    end_date = project.pledging_ends_on
    start_date = Time.now
    if project.blank?
      "<em>Date was kept blank</em>".html_safe
    elsif project.expired?
      "<strong><em>All Done!</em></strong>".html_safe + " #{(start_date.to_date - end_date.to_date).to_i} days ago"
    elsif project.more_29_days?
      "#{( end_date.to_date - start_date.to_date ).to_i} days remaining".html_safe
    else
      "#{end_date} " + distance_of_time_in_words( project.pledging_ends_on, Time.now ) + " remaining".html_safe
    end
  end

end
