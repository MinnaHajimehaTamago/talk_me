require 'rails_helper'

RSpec.describe 'サインに関する機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  describe 'サイン送信機能' do
    context 'サインの送信に成功した時' do
      it 'サインの送信に成功するとサイン一覧ページに遷移すること' do
        sign_in(@user)
        visit new_sign_path
        fill_in 'signs_tag_text', with: 'test'
        fill_in 'signs_tag_input', with: 'test'
        find('#tag_add_btn').click
        expect {
          find('input[name="commit"]').click
        }.to change { Sign.count }.by(1)
        expect(current_path).to eq my_signs_signs_path
      end
      it '送信したサインがマイサイン一覧に表示されること' do
        sign_in(@user)
        visit new_sign_path
        text = 'testText'
        tag = 'testTag'
        fill_in 'signs_tag_text', with: text
        fill_in 'signs_tag_input', with: tag
        find('#tag_add_btn').click
        expect {
          find('input[name="commit"]').click
        }.to change { SignTagRelation.count }.by(1)
        visit my_signs_signs_path
        expect(page).to have_content(tag)
      end
    end

    context 'サインの送信に失敗した時' do
      it 'textが空の場合、送信に失敗し、サイン送信画面に戻ってくること' do
        sign_in(@user)
        visit new_sign_path
        fill_in 'signs_tag_input', with: 'test'
        find('#tag_add_btn').click
        expect {
          find('input[name="commit"]').click
        }.to change { Sign.count }.by(0)
        expect(current_path).to eq new_sign_path
      end
      it 'nameがからの場合、送信に失敗し。サイン送信画面に戻ってくること' do
        sign_in(@user)
        visit new_sign_path
        fill_in 'signs_tag_text', with: 'test'
        expect {
          find('input[name="commit"]').click
        }.to change { Sign.count }.by(0)
        expect(current_path).to eq new_sign_path
      end
    end
  end

  describe 'サイン詳細機能' do
    it '送信したサインの内容が表示されること' do
      sign_in(@user)
      visit new_sign_path
      fill_in 'signs_tag_text', with: 'testText'
      fill_in 'signs_tag_input', with: 'testTag'
      find('#tag_add_btn').click
      expect {
        find('input[name="commit"]').click
      }.to change { Sign.count }.by(1)
      visit sign_path(@user.signs[-1].id)
      expect(page).to have_content('testText')
      expect(page).to have_content('testTag')
    end
    it '削除ボタンをクリックするとサインが削除されること' do
      sign_in(@user)
      visit new_sign_path
      fill_in 'signs_tag_text', with: 'testText'
      fill_in 'signs_tag_input', with: 'testTag'
      find('#tag_add_btn').click
      expect {
        find('input[name="commit"]').click
      }.to change { Sign.count }.by(1)
      visit sign_path(@user.signs[-1].id)
      expect {
        find('.sign-delete-link').click
      }.to change { Sign.count }.by(-1)
    end
    context 'ボタンの表示テスト' do
      before do
        @sign = Sign.create(text: 'test', user_id: @user.id)
        tag = FactoryBot.create(:tag)
        SignTagRelation.create(sign_id: @sign.id, tag_id: tag.id)
        @user_2 = User.create(nickname: 'テストユーザー２', email: 'test2@example.com', password: 'password', password_confirmation: 'password')
        sleep 0.1
      end
      it '送信者以外には削除ボタンが表示されないこと' do
        sign_in(@user_2)
        visit sign_path(@sign.id)
        expect(page).not_to have_selector('.sign-delete-link')
      end
      it '話しかけたことがない人のサインには話しかけるボタンが表示されること' do
        sign_in(@user_2)
        visit sign_path(@sign.id)
        expect(page).to have_content('話しかける')
        expect(page).not_to have_content('トークルームへ')
      end
      it '話しかけたことがある人のサインにはトークルームへ遷移するボタンが表示されること' do
        @room = Room.create
        RoomUserRelation.create(room_id: @room.id, user_id: @user.id)
        RoomUserRelation.create(room_id: @room.id, user_id: @user_2.id)
        sign_in(@user_2)
        visit sign_path(@sign.id)
        expect(page).to have_content('トークルームへ')
        expect(page).not_to have_content('話しかける')
      end
      it '送信者には話しかけるボタンが表示されないこと' do
        sign_in(@user)
        visit sign_path(@sign.id)
        expect(page).not_to have_content('話しかける')
        expect(page).not_to have_content('トークルームへ')
      end
    end
  end

  describe 'タグ機能' do
    context '入力候補機能テスト' do
      before do
        @tag = FactoryBot.create(:tag)
        sleep 0.1
      end 
      it '既に登録されているタグを検索し、入力候補に表示されること' do
        sign_in(@user)
        visit new_sign_path
        fill_in 'signs_tag_input', with: @tag.name
        expect(page).to have_content(@tag.name)
      end
      it '入力候補のタグをクリックすると付けるタグ一覧に追加されること' do
        sign_in(@user)
        visit new_sign_path
        fill_in 'signs_tag_input', with: @tag.name
        find('.tag-candidate').click
        expect(page).to have_content @tag.name
      end
      it '登録されていないタグは候補に表示されないこと' do
        tag2 = FactoryBot.create(:tag)
        sign_in(@user)
        visit new_sign_path
        fill_in 'signs_tag_input', with: tag2.name
        expect(page).not_to have_content(@tag.name)
      end
    end
  end
end