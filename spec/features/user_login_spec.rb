require 'rails_helper'

RSpec.feature "User Login", type: :feature, js: true do

  before :each do
    User.create!(
      first_name: 'Test',
      last_name: 'User',
      email: 'usertest@gmail.com',
      password: '123456789',
      password_confirmation: '123456789'
    ) 
  end


  scenario "A user can login and is redirected to the home page" do
    # ACT
    visit root_path
    click_link 'Login'
    fill_in 'email', with: 'usertest@gmail.com'
    fill_in 'password', with: '123456789'
    click_button 'Login'
       
    # DEBUG / VERIFY
    expect(page).to have_content 'Logout'
  end
end
