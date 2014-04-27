require 'spec_helper'
require 'capybara/rspec'

Capybara.app = Application

feature 'Homepage' do
  scenario 'Sees colors that have been created' do
    visit '/'
    visit '/colors/new'
    fill_in 'name', with: 'red'
    fill_in 'characteristic', with: 'vibrant'
    fill_in 'rating_1_to_5', with: 5
    click_on 'Create Color'
    expect(page).to have_content 'red'
  end
end