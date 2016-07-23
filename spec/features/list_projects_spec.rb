require 'rails_helper'

describe "Listing projects" do

  it "does not show a project that is no longer accepting pledges" do
    project = Project.create( name: "Primark",
                              description: "We are going to create the next big thing",
                              target_pledge_amount: 100000,
                              website: "www.zekerweten.nl",
                              pledging_ends_on: 1.day.ago,
                              image_file_name: "project_icon1.jpg")

    visit projects_path

    expect(page).not_to have_text(project.name)
    expect(page).not_to have_selector("img[src$='#{project.image_file_name}']")
  end

end
