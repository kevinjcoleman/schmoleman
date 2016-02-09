require 'rails_helper'

describe 'site administrator' do
  it "accesses the dashboard" do
    User.create(
      email: 'user@example.com',
      password: 'password',
      password_confirmation: 'password'
    )

    visit root_path
    click_link 'Log in'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    expect(page).to have_content("Admin::Dashboard#index")
    within '.navbar-brand' do
      expect(page).to have_content 'Admin'
    end

  end
end