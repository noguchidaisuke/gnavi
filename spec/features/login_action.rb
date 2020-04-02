require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario "pending..." do
    user = FactoryBot.create(:user,:testuser)
    comment = FactoryBot.create(:comment, user: user)
    visit root_path
    click_link "Login"
    click_button "テストログイン"
    expect(page).to have_content user.name
    expect(page).to have_content "MyPage"
    click_link "投稿一覧"
    expect(page).to have_content comment.comment
  end
end