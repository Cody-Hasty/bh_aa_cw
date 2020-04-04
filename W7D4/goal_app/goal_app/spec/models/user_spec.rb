# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:password_digest)}
  it {should validate_presence_of(:session_token)}

  feature 'signup' do 
    scenario 'has signup page' do
      visit new_user_url
      expect(page).to have_content("Sign Up")
    end

    scenario 'takes credentials' do
      visit new_user_url
      expect(page).to have_content("Username")
      expect(page).to have_content("Password")
    end

    scenario 'redirect user to user showpage and display username' do
      visit new_user_url
      fill_in 'Username', with: "rayzah blaydes"
      fill_in 'Password', with: "down undah"
      # save_and_open_page
      click_button 'Create User'
      expect(page).to have_content("rayzah blaydes")
      user = User.find_by(username: "rayzah blaydes")
      expect(current_url).to eq(user_url(user))
    end
  end
  
  feature 'Log Out' do
    background
      visit new_user_url
      fill_in 'Username', with: "rayzah blaydes"
      fill_in 'Password', with: "down undah"
      # save_and_open_page
      click_button 'Create User'
      
    scenario 'Has log out button' do
      visit user_url(user)
    end
  end
end

# per stack overflow
  # it { should validate_presence_of(:name)}

# RubyDocs
# RSpec.describe Robot, type: :model do
#   it { should validate_presence_of(:arms) }
# end
