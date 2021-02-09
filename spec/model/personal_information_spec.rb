require 'rails_helper'

describe PersonalInformation, type: :model do
  describe '本人情報新規登録' do
    before do
      @personal_information = FactoryBot.build(:personal_information)
    end
    
    context '本人情報新規登録ができる時' do
      it '全ての値が正しく入力されていれば登録できること' do
        expect(@personal_information).to be_valid
      end
    end

    context '本人情報新規登録ができない時' do
      it 'first_nameが空の時' do
        @personal_information.first_name = nil
        @personal_information.valid?
        expect(@personal_information.errors.full_messages).to include('姓（全角）を入力してください')
      end
      it 'first_nameが漢字・ひらがな・カタカナ（全角）以外では登録できないこと' do
        @personal_information.first_name = 'nameﾅﾏｴ'
        @personal_information.valid?
        expect(@personal_information.errors.full_messages).to include('姓（全角）は全角（漢字・ひらがな・カタカナ）で入力してください')
      end
      it 'last_nameが空では登録できない' do
        @personal_information.last_name = nil
        @personal_information.valid?
        expect(@personal_information.errors.full_messages).to include('名（全角）を入力してください')
      end
      it 'last_nameが漢字・ひらがな・カタカナ（全角）以外では登録できないこと' do
        @personal_information.last_name = 'nameﾅﾏｴ'
        @personal_information.valid?
        expect(@personal_information.errors.full_messages).to include('名（全角）は全角（漢字・ひらがな・カタカナ）で入力してください')
      end
      it 'first_name_kanaが空では登録できない' do
        @personal_information.first_name_kana = nil
        @personal_information.valid?
        expect(@personal_information.errors.full_messages).to include('姓（全角カナ）を入力してください')
      end
      it 'first_name_kanaがカタカナ以外では登録できない' do
        @personal_information.first_name_kana = 'name'
        @personal_information.valid?
        expect(@personal_information.errors.full_messages).to include('姓（全角カナ）はカタカナで入力して下さい。')
      end
      it 'last_name_kanaが空では登録できない' do
        @personal_information.last_name_kana = nil
        @personal_information.valid?
        expect(@personal_information.errors.full_messages).to include('名（全角カナ）を入力してください')
      end
      it 'last_name_kanaがカタカナ以外では登録できない' do
        @personal_information.last_name_kana = 'name'
        @personal_information.valid?
        expect(@personal_information.errors.full_messages).to include('名（全角カナ）はカタカナで入力して下さい。')
      end
      it 'birth_dateが空では登録できない' do
        @personal_information.birth_date = nil
        @personal_information.valid?
        expect(@personal_information.errors.full_messages).to include('生年月日を入力してください')
      end
    end
  end
end