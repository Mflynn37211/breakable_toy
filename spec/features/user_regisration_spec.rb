require 'rails_helper'

feature "User registration, sign in and sign out" do

  # user signs up
  scenario 'user signs up with correct credentials' do
    #setup, user interaction & expeectation

    user = FactoryGirl.build(:user)

    visit root_path

    click_on "Sign up"
    fill_in "Email", with: user.email
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
    attach_file "Profile photo", Rails.root.join('spec/file_fixtures/profile.jpg')

    click_on "Register"

    expect(page).to have_content("A message with a confirmation link has been sent to your email address.")

    # the email we just sent should have the proper subject and recipient:
  #   last_email = ActionMailer::Base.deliveries.last
  #   expect(last_email).to have_subject('Confirmation instructions')
  #   expect(last_email).to deliver_to(user.email)
  #   expect(last_email.body).to have_content("Confirm my account")
  end

  #user signs in

  scenario 'user signs in with correct credentials' do

    user = FactoryGirl.create(:user)
    user.confirmed_at = Time.now
    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"

    expect(page).to have_content("Signed in successfully.")

  end

  # user signs out

  scenario 'user signs out' do

    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"
    click_on "Sign out"

    expect(page).to have_content( "Signed out successfully.")

  end

end
