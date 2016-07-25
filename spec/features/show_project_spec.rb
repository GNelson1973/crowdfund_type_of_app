require 'rails_helper'

describe "Viewing an individual project" do
  it "shows the projects details" do
    project = Project.create( name: "Start-up Project",
                              description: "A description of a start-up projects",
                              target_pledge_amount: 100.00,
                              website: "http://project-a.com",
                              pledging_ends_on: 1.day.from_now,
                              team_members: "Nelson",
                              )

    visit project_url(project)

    expect(page).to have_text(project.name)
    expect(page).to have_text(project.description)
    expect(page).to have_text("EUR 100.00")
    expect(page).to have_text(project.website)
    expect(page).to have_text(project.pledging_ends_on)
    expect(page).to have_text(project.team_members)
    expect(page).to have_selector("img[src$='#{project.image_file_name}']")
  end

end
