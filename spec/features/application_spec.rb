require 'spec_helper'
require 'capybara/rspec'

Capybara.app = Application

feature 'Homepage' do
  scenario 'Shows the welcome message' do
    visit '/'

    expect(page).to have_content 'Welcome!'
  end

  scenario 'User can add a shoe entry' do
    visit '/'

    click_on "Add a shoe entry"

    fill_in "style", with: "Doc Martens"
    fill_in "size", with: "9"

    click_on "Add Shoe"

    expect(page).to have_content"Doc Martens"
    expect(page).to have_content"9"
  end

  scenario 'User can edit a shoe entry' do
    visit '/'

    click_on "Add a shoe entry"

    fill_in "style", with: "Steve Madden"
    fill_in "size", with: "9"

    click_on "Add Shoe"

    click_on "Steve Madden"

    fill_in "style", with: "Adidas"

    click_on "Update Shoes"

    expect(page).to have_no_content "Steve Madden"
    expect(page).to have_content "Adidas"


  end
end