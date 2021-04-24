require 'rails_helper'

describe Tag, type: :model do
  describe 'サイン投稿機能' do
    before do
      @tag = FactoryBot.build(:tag)
    end

    context 'タグが登録できる時' do
      it '全ての値が正しく入力されていれば登録できること' do
        expect(@tag).to be_valid
      end
    end

    context 'タグが登録できない時' do
      it 'nameが入力されていないと登録できないこと' do
        @tag.name = nil
        @tag.valid?
        expect(@tag.errors.full_messages).to include('タグは１つ以上追加してください')
      end
      it 'officiality_idが入力されていないと登録できないこと' do
        @tag.officiality_id = nil
        @tag.valid?
        expect(@tag.errors.full_messages).to include('公式判定を入力してください')
      end
      it 'officiality_idが0,1,2以外だと登録できないこと' do
        @tag.officiality_id = 3
        @tag.valid?
        expect(@tag.errors.full_messages).to include('公式判定は0~2の間で入力してください')
      end
    end
  end
end