require 'rails_helper'

RSpec.feature "User", type: :feature do

  it 'can create a link if they are authenticated' do
    user = User.create!(email: 'user@email.com', password: 'password')
    link = user.links.create(title: 'Turing', url: 'http://www.turing.io')

    visit root_path

    click_link_or_button "Login"
    fill_in "Email", with: 'user@email.com'
    fill_in 'Password', with: 'password'
    click_link_or_button "Login"

    expect(link).to be_valid
    expect(page).to have_content('Turing')
  end
end
