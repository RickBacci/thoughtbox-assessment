require 'rails_helper'

RSpec.describe User, type: :model do

  it 'has an email' do
    user = User.new(email: 'test@email.com', password: 'password')

    expect(user)

    user.email = ''

    expect(user.save).to eql(false)
  end


  it 'has a valid email' do
    user = User.create(email: 'test@email.com', password: 'password')

    expect(user)

    user.email = 'testemail.com'

    expect(user.save).to eql(false)
  end

  it 'has a unique email' do
    user = User.create(email: 'test@email.com', password: 'password')
    user2 = User.new(email: 'test@email.com', password: 'password')

    expect(user)
    expect(user2.save).to eql(false)
  end
end

