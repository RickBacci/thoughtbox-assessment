require 'rails_helper'

RSpec.feature "User", type: :feature do

  it 'can login' do
    User.create(email: 'user@email.com', password: 'password')

    visit root_path

    click_link "Login"
    fill_in "Email", with: 'user@email.com'
    fill_in 'Password', with: 'password'
    click_link_or_button "Login"

    expect(page).to have_content('Welcome')
    expect(page).to have_link('Logout')
    expect(page).to_not have_link('Login')
  end

  it 'can logout' do
    User.create(email: 'user@email.com', password: 'password')

    visit root_path

    click_link "Login"
    fill_in "Email", with: 'user@email.com'
    fill_in 'Password', with: 'password'
    click_link_or_button "Login"

    expect(page).to have_content('Welcome')

    click_link_or_button "Logout"

    expect(page).to have_link('Login')
    expect(page).to_not have_link('Logout')
  end
end

