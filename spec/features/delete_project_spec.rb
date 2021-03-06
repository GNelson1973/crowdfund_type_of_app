require 'rails_helper'

describe "Deleting a project" do
  it "destroys the project and shows the project listing without the deleted project" do
    project = Project.create( name: "bella",
                              description: "We are going to create the next big thing",
                              target_pledge_amount: 100000,
                              website: "www.zekerweten.nl",
                              team_members: "Nelson",
                              pledging_ends_on: 1.month.from_now)

    visit project_path(project)

    click_link 'Delete'

    expect(current_path).to eq(projects_path)
    expect(page).not_to have_text(project.name)
  end
end
