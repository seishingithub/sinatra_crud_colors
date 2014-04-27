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

  scenario 'Can update a color' do
    visit '/colors/new'
    fill_in 'name', with: 'red'
    fill_in 'characteristic', with: 'vibrant'
    fill_in 'rating_1_to_5', with: 5
    click_on 'Create Color'
    click_on 'red'
    click_on 'Edit Color'
    fill_in 'name', with: 'yellow'
    fill_in 'characteristic', with: 'sunny'
    fill_in 'rating_1_to_5', with: 3
    click_on 'Update Color'
    expect(page).to have_content('yellow')
    expect(page).to_not have_content('red')
  end

  scenario 'Can delete a color' do
    visit '/colors/new'
    fill_in 'name', with: 'red'
    fill_in 'characteristic', with: 'vibrant'
    fill_in 'rating_1_to_5', with: 5
    click_on 'Create Color'

    click_on 'red'
    click_on 'Delete Color'

    expect(page).to_not have_content('red')
  end
end