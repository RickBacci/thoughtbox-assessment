require 'rails_helper'

RSpec.feature "Link", type: :feature, js:true do

  it 'status can be updated by user' do
    user = User.create!(email: 'user@email.com', password: 'password')
    link = user.links.create(title: 'Turing', url: 'http://www.turing.io')

    visit root_path

    click_link_or_button "Login"
    fill_in "Email", with: 'user@email.com'
    fill_in 'Password', with: 'password'
    click_link_or_button "Login"



    click_link_or_button "Mark as Read"

    expect(page).to have_css('tr.false')
  end
end
