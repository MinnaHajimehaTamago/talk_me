require 'rails_helper'

RSpec.describe 'メッセージに関する機能', type: :system do
  before do
    @user_1 = FactoryBot.create(:user)
    @user_2 = User.create(nickname: 'テストユーザー２', email: 'test2@example.com', password: 'password', password_confirmation: 'password')
    @room = Room.create
    RoomUserRelation.create(room_id: @room.id, user_id: @user_1.id)
    RoomUserRelation.create(room_id: @room.id, user_id: @user_2.id)
  end

  describe 'メッセージ送信機能' do
    context 'メッセージの送信に成功する時' do
      it 'textが入力されていればメッセージの送信に成功し、右寄せで内容が表示されること' do
        sign_in(@user_1)
        visit room_messages_path(@room.id)
        fill_in 'message_text', with: 'test'
        expect {
          find('input[name="commit"]').click
        }.to change { Message.count }.by(1)
        expect(page).to have_selector('.message-wrap-right')
        expect(page).to have_content('test')
      end
      it '受信者にはメッセージが左寄せで表示されること' do
        Message.create(text: 'test', user_id: @user_2.id, room_id: @room.id)
        sign_in(@user_1)
        visit room_messages_path(@room.id)
        expect(page).to have_selector('.message-wrap-left')
        expect(page).to have_content('test')
      end
    end
  end
end