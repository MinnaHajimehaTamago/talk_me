require 'rails_helper'

describe Sign, type: :model do
  describe 'サイン投稿機能' do
    before do
      @sign = FactoryBot.build(:sign)
    end

    context 'サインが登録できる時' do
      it '全ての値が正しく入力されていれば登録できること' do
        expect(@sign).to be_valid
      end
    end

    context 'サインが登録できない時' do
      it 'first_nameが空のでは登録できないこと' do
        @sign.first_name = nil
        @sign.valid?
        expect(@sign.errors.full_messages).to include('姓（全角）を入力してください')
      end
      it 'first_nameが漢字・ひらがな・カタカナ（全角）以外では登録できないこと' do
        @sign.first_name = 'nameﾅﾏｴ'
        @sign.valid?
        expect(@sign.errors.full_messages).to include('姓（全角）は全角（漢字・ひらがな・カタカナ）で入力してください')
      end
      it 'last_nameが空では登録できないこと' do
        @sign.last_name = nil
        @sign.valid?
        expect(@sign.errors.full_messages).to include('名（全角）を入力してください')
      end
      it 'last_nameが漢字・ひらがな・カタカナ（全角）以外では登録できないこと' do
        @sign.last_name = 'nameﾅﾏｴ'
        @sign.valid?
        expect(@sign.errors.full_messages).to include('名（全角）は全角（漢字・ひらがな・カタカナ）で入力してください')
      end
      it 'first_name_kanaが空では登録できないこと' do
        @sign.first_name_kana = nil
        @sign.valid?
        expect(@sign.errors.full_messages).to include('姓（全角カナ）を入力してください')
      end
      it 'first_name_kanaがカタカナ以外では登録できないこと' do
        @sign.first_name_kana = 'name'
        @sign.valid?
        expect(@sign.errors.full_messages).to include('姓（全角カナ）はカタカナで入力してください')
      end
      it 'last_name_kanaが空では登録できないこと' do
        @sign.last_name_kana = nil
        @sign.valid?
        expect(@sign.errors.full_messages).to include('名（全角カナ）を入力してください')
      end
      it 'last_name_kanaがカタカナ以外では登録できないこと' do
        @sign.last_name_kana = 'name'
        @sign.valid?
        expect(@sign.errors.full_messages).to include('名（全角カナ）はカタカナで入力してください')
      end
      it 'state_idが空では登録できないこと' do
        @sign.state_id = nil
        @sign.valid?
        expect(@sign.errors.full_messages).to include('都道府県を選択してください')
      end
      it 'state_idが1では登録できないこと' do
        @sign.state_id = 1
        @sign.valid?
        expect(@sign.errors.full_messages).to include('都道府県を選択してください')
      end
      it 'cityが空では登録できないこと' do
        @sign.city = nil
        @sign.valid?
        expect(@sign.errors.full_messages).to include('市区町村を入力してください')
      end
      it 'spot_type_idが空では登録できないこと' do
        @sign.spot_type_id = nil
        @sign.valid?
        expect(@sign.errors.full_messages).to include('場所の特徴を選択してください')
      end
      it 'spot_type_idが1では登録できないこと' do
        @sign.spot_type_id = 1
        @sign.valid?
        expect(@sign.errors.full_messages).to include('場所の特徴を選択してください')
      end
      it 'position_idが空では登録できないこと' do
        @sign.position_id = nil
        @sign.valid?
        expect(@sign.errors.full_messages).to include('「どこに」を選択してください')
      end
      it 'position_idが1では登録できないこと' do
        @sign.position_id = 1
        @sign.valid?
        expect(@sign.errors.full_messages).to include('「どこに」を選択してください')
      end
      it 'characteristic_idが空では登録できないこと' do
        @sign.characteristic_id = nil
        @sign.valid?
        expect(@sign.errors.full_messages).to include('「何を」を選択してください')
      end
      it 'characteristic_idが1では登録できないこと' do
        @sign.characteristic_id = 1
        @sign.valid?
        expect(@sign.errors.full_messages).to include('「何を」を選択してください')
      end
      it 'content_idが空では登録できないこと' do
        @sign.content_id = nil
        @sign.valid?
        expect(@sign.errors.full_messages).to include('サインの内容を選択してください')
      end
      it 'content_idが1では登録できないこと' do
        @sign.content_id = 1
        @sign.valid?
        expect(@sign.errors.full_messages).to include('サインの内容を選択してください')
      end
    end
  end
end
