require 'rails_helper'

RSpec.describe Link, type: :model do

  it 'has a default status of false' do
    link = Link.create(url: 'http://www.google.com', title: 'Google')

    expect(link.status).to be_falsey
  end

  it 'has a title' do
    link = Link.create(url: 'http://www.google.com', title: 'Google')
    link.title = ''

    expect(link).to be_invalid

    link.title = nil

    expect(link).to be_invalid

    link.title = 'Turing'

    expect(link).to be_valid
  end

  it 'has a valid Url' do
    link = Link.create(url: 'http://www.google.com', title: 'Google')

    link.url = 'asdf'

    expect(link.save).to be_falsey

    link.url = 'http://www.turing.io'

    expect(link.save).to be_truthy
  end



end

