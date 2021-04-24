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
      it 'textが入力されていないと登録できないこと' do
        @sign.text = nil
        @sign.valid?
        expect(@sign.errors.full_messages).to include('メッセージを入力してください')
      end
    end
  end
end
