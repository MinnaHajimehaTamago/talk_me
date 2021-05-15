require 'rails_helper'

RSpec.describe 'ユーザー管理機能', type: :system do
  describe 'ログインテスト' do
    before do
      @user = FactoryBot.create(:user)
    end

    context 'ログインに成功する時' do
      it 'ログインに成功し、サイン一覧ページに遷移する' do
        visit new_user_session_path
        fill_in 'email', with: @user.email
        fill_in 'password', with: @user.password
        click_button 'ログインする'
        expect(current_path).to eq signs_path
      end
    end

    context 'ログインに失敗する時' do
      it 'ログインに失敗し、再びログインページに戻ってくる' do
        visit new_user_session_path
        fill_in 'email', with: 'wrong@com'
        fill_in 'password', with: 'wrongPassword'
        click_button 'ログインする'
        expect(current_path).to eq new_user_session_path
      end
    end
  end 

  describe 'ログインしていない状態の画面遷移制限テスト' do
    context 'ログインしていないとログインページに遷移すること' do
      it 'サイン一覧ページ' do
        visit signs_path
        expect(current_path).to eq new_user_session_path
      end
      it 'サイン送信ページ' do
        visit new_sign_path
        expect(current_path).to eq new_user_session_path
      end
      it 'サイン情報詳細ページ' do
        visit sign_path(1)
        expect(current_path).to eq new_user_session_path
      end
      it 'サイン検索ページ' do
        visit search_index_signs_path
        expect(current_path).to eq new_user_session_path
      end
      it 'サイン検索結果ページ' do
        visit search_result_signs_path
        expect(current_path).to eq new_user_session_path
      end
      it '送信したサイン一覧ページ' do
        visit my_signs_signs_path
        expect(current_path).to eq new_user_session_path
      end
      it 'プロフィールタグにマッチしたサイン一覧ページ' do
        visit match_signs_signs_path
        expect(current_path).to eq new_user_session_path
      end
      it 'ユーザー情報詳細ページ' do
        visit user_path(1)
        expect(current_path).to eq new_user_session_path
      end
      it 'ユーザー情報編集ページ' do
        visit edit_user_path(1)
        expect(current_path).to eq new_user_session_path
      end
      it 'ユーザープロフィールタグ登録ページ' do
        visit new_tag_path
        expect(current_path).to eq new_user_session_path
      end
      it 'ユーザープロフィールタグ登録ページ（サインアップ時のページ）' do
        visit after_sign_up_new_tags_path
        expect(current_path).to eq new_user_session_path
      end
      it 'メッセージ一覧ページ' do
        visit room_messages_path(1)
        expect(current_path).to eq new_user_session_path
      end
      it 'トークルーム一覧ページ' do
        visit rooms_path
        expect(current_path).to eq new_user_session_path
      end
      it  '話しかけてきた人一覧ページ' do
        visit talk_rooms_rooms_path
        expect(current_path).to eq new_user_session_path
      end
    end
  end

  describe 'プロフィール編集機能テスト' do
    before do
      @user = FactoryBot.create(:user)
    end
    describe 'プロフィール編集機能' do
      it 'ニックネームの編集に成功し、プロフィールページに遷移し、ニックネームが変更されていること' do
        sign_in(@user)
        visit edit_user_path(@user)
        fill_in 'user_nickname', with: 'test'
        click_button '変更する'
        expect(current_path).to eq user_path(@user)
        expect(page).to have_content('test')
      end
      it 'アイコン画像の編集に成功し、プロフィールページに遷移し、アイコン画像が変更されていること' do
        sign_in(@user)
        visit user_path(@user)
        beforeImg = find('.user-icon-image-large')[:src]
        visit edit_user_path(@user)
        image_path = Rails.root.join('public/kumao0.png')
        attach_file('user[image]', image_path, make_visible: true)
        click_button '変更する'
        expect(current_path).to eq user_path(@user)
        afterImg = find('.user-icon-image-large')[:src]
        expect(afterImg).not_to eq beforeImg
      end
    end
    describe 'プロフィールタグ登録機能' do
      context 'プロフィールタグの登録に成功する時' do
        it 'nameが入力されていれぱ登録に成功し、再びプロフィールタグ登録画面に戻り、プロフィールタグ一覧に表示されること' do
          sign_in(@user)
          visit new_tag_path
          fill_in 'users_tag_name', with: 'test'
          expect {
            find('input[name="commit"]', visible: false).click
          }.to change { UserTagRelation.count }.by(1)
          expect(current_path).to eq new_tag_path
          expect(page).to have_content 'test'
        end
      end
      context 'プロフィールタグの登録に失敗する時' do
        it 'nameが入力されていないと登録に失敗し、再びプロフィールタグ登録画面に戻ること' do
          sign_in(@user)
          visit new_tag_path
          expect {
            find('input[name="commit"]', visible: false).click
          }.to change { UserTagRelation.count }.by(0)
          expect(current_path).to eq new_tag_path
        end
      end
      context 'プロフィールタグの削除に成功する時' do
        it '削除ボタンをクリックするとプロフィールタグが削除され、再びプロフィールタグ登録画面に戻ること' do
          tag = FactoryBot.create(:tag)
          UserTagRelation.create(user_id: @user.id, tag_id: tag.id)
          sign_in(@user)
          visit new_tag_path
          expect {
            find('.tag-delete-link').click
          }.to change { UserTagRelation.count }.by(-1)
          expect(current_path).to eq new_tag_path
        end
      end
    end
  end
end