require 'rails_helper'

describe "Editing a project" do

    it "updates the project and shows the project's updated details" do
      project = Project.create( name: "abn",
                                description: "We are going to create the next big thing",
                                target_pledge_amount: 100000,
                                website: "www.zekerweten.nl",
                                pledging_ends_on: 1.month.from_now)

      visit project_url(project)

      click_link 'Edit'

      expect(current_path).to eq(edit_project_path(project))

      expect(find_field('Name').value).to eq(project.name)
    end

end
