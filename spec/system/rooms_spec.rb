require 'rails_helper'

RSpec.describe 'ルームに関する機能', type: :system do
  describe 'トークルーム作成機能' do
    it 'サイン詳細ページの話しかけるボタンをクリックするとトークルームが作成されること' do
      signData = FactoryBot.create(:sign_tag_relation)
      user_2 = User.create(nickname: 'テストユーザー２', email: 'test2@example.com', password: 'password', password_confirmation: 'password')
      sign_in(user_2)
      visit sign_path(signData.sign.id)
      expect {
        find('.submit-btn').click
      }.to change { Room.count }.by(1)
      expect(current_path).to have_text(/.*\/rooms\/.*\/messages/)
    end
  end
end