require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'メッセージ送信' do
    before do
      @message = FactoryBot.build(:message)
    end

    context 'メッセージが登録できる時' do
      it 'textが入力されていれば登録できること' do
        expect(@message).to be_valid
      end
    end

    context 'メッセージが登録できない時' do
      it 'textが空だと登録できないこと' do
        @message.text = nil
        @message.valid?
        expect(@message.errors.full_messages).to include('メッセージを入力してください')
      end
    end
  end
end