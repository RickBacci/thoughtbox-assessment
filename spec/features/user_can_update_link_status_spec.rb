require 'rails_helper'

RSpec.feature "Link", type: :feature, js:true do

  it 'can be marked as read' do
    user = User.create!(email: 'testuser@email.com', password: 'password')
    link = user.links.create!(title: 'Turing', url: 'http://www.turing.io')

    visit root_path

    click_link_or_button "Login"
    fill_in "Email", with: 'testuser@email.com'
    fill_in 'Password', with: 'password'
    click_link_or_button "Login"

    click_link_or_button "Mark as Read"

    expect(page).to have_content("Mark as Unread")
    expect(page).to have_css('tr.false')
  end

  it 'can be marked as unread' do
    user = User.create!(email: 'testuser@email.com', password: 'password')
    link = user.links.create!(title: 'Turing', url: 'http://www.turing.io')

    visit root_path

    click_link_or_button "Login"
    fill_in "Email", with: 'testuser@email.com'
    fill_in 'Password', with: 'password'
    click_link_or_button "Login"

    click_link_or_button "Mark as Read"

    expect(page).to have_content("Mark as Unread")
    click_link_or_button "Mark as Unread"
    expect(page).to have_content("Mark as Read")
  end

  it 'changes color to red when it is marked as read' do
    user = User.create!(email: 'testuser@email.com', password: 'password')
    link = user.links.create!(title: 'Turing', url: 'http://www.turing.io')

    visit root_path

    click_link_or_button "Login"
    fill_in "Email", with: 'testuser@email.com'
    fill_in 'Password', with: 'password'
    click_link_or_button "Login"

    click_link_or_button "Mark as Read"

    expect(page).to have_css('tr.red')

    expect(page).to have_content("Mark as Unread")
  end

  it 'changes color to black when it is marked as unread' do
    user = User.create!(email: 'testuser@email.com', password: 'password')
    link = user.links.create!(title: 'Turing', url: 'http://www.turing.io')

    visit root_path

    click_link_or_button "Login"
    fill_in "Email", with: 'testuser@email.com'
    fill_in 'Password', with: 'password'
    click_link_or_button "Login"

    click_link_or_button "Mark as Read"

    expect(page).to have_css('tr.red')
    expect(page).to have_content("Mark as Unread")

    click_link_or_button "Mark as Unread"

    expect(page).to have_css('tr.black')
    expect(page).to have_content("Mark as Read")
  end
end

