require_relative 'web_helper'

feature 'User sign up' do
  scenario 'I can sign up a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, zoe@example.com')
    expect(User.first.email).to eq('zoe@example.com')
  end

  scenario 'requires a matching confirmation password' do
    # again it's questionable whether we should be testing the model at this
    # level.  We are mixing integration tests with feature tests.
    # However, it's convenient for our purposes.
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end
end
