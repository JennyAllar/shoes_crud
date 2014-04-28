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
  end
end