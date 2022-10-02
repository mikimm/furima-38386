require 'rails_helper'

RSpec.describe Order, type: :model do

  describe '購入情報' do
    before do
      binding.pry
      @order = FactoryBot.build(:order)
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)

    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'user_idが空だと保存できないこと' do
        @user.id=nil
        @user.valid?
        expect(@user.errors.full_messages).to include("User id can't be blank")
      end

      it 'item_idが空だと保存できないこと' do
        @item.id=nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item id can't be blank")
      end


    end
  end
end