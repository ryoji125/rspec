require 'rails_helper'

RSpec.describe 'Users', type: :system do
  it 'ユーザー新規作成画面にいけてアカウントを作成できること' do
    #ユーザー新規作成ページへ移動
    visit new_user_registration_path
    #idがuser_emailのフォームにsampleemail@email.comを入力
    fill_in "user_email", with: "sampleemail@email.com"
    #idがuser_passwordのフォームにpasswordを入力
    fill_in "user_password", with: "password"
    #idがuser_password_confirmationのフォームにpasswordを入力
    fill_in "user_password_confirmation", with: "password"
    #Sign upのボタンをクリック
    click_button 'Sign up'
    #ページ内にWelcome! You have signed up successfully.との表示があること
    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  it 'ユーザーログイン画面からログインできること' do
    User.create(email:"samples@email.com",password:"password")
    #ユーザー新規作成ページへ移動
    visit new_user_session_path
    #idがuser_emailのフォームにsampleemail@email.comを入力
    fill_in "user_email", with: "samples@email.com"
    #idがuser_passwordのフォームにpasswordを入力
    fill_in "user_password", with: "password"
    #Sign upのボタンをクリック
    click_button 'Log in'
    #ページ内にWelcome! You have signed up successfully.との表示があること
    expect(page).to have_content "Signed in successfully."
  end
end