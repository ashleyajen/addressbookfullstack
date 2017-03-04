require 'rails_helper'

RSpec.feature "LandingPages", type: :feature do
  context "Landing page" do
    Steps "Going to Landing page" do
      Given "I visit localhost 3000:" do
        visit "/"
      end
      Then "I see Address Book" do
        expect(page).to have_content("Address Book")
      end
    end
  end
  context "Create contact" do
    Steps "Creating a contact" do
      Given "that I am on the landingpage" do
        visit "/"
      end
      Then "I can create a contact" do
        fill_in 'name', with: 'Don'
        fill_in 'surname', with: 'Ready'
        fill_in 'email', with: 'donready@hotmail.com'
        fill_in 'address', with: '123 First Street'
        click_button 'Submit'
      end
      Then 'I am taken to a page that lists my contacts' do
        expect(page).to have_content 'Don'
        expect(page).to have_content 'Ready'
        expect(page).to have_content 'donready@hotmail.com'
        expect(page).to have_content '123 First Street'
      end
    end
  end
end
