require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '出品機能' do
    context '出品できる場合' do
      it 'category_id,condition_id,burden_id,region_id,shippment_days_id,name,explanation,price,imageが存在していれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できない場合' do
      it 'user_idが存在しなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'category_idが存在しなければ登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'condition_idが存在しなければ登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'condition_idが1では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end
      it 'burden_idが存在しなければ登録できない' do
        @item.burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden can't be blank")
      end
      it 'burden_idが1では登録できない' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Burden must be other than 1')
      end
      it 'region_idが存在しなければ登録できない' do
        @item.region_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end
      it 'region_idが1では登録できない' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Region must be other than 1')
      end
      it 'shippment_days_idが存在しなければ登録できない' do
        @item.shippment_days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shippment days can't be blank")
      end
      it 'shippment_days_idが1では登録できない' do
        @item.shippment_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shippment days must be other than 1')
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格に半角数字以外が含まれている場合は出品できない' do
        @item.price = '３５０'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it '価格が300円未満では出品できない' do
        @item.price = 234
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it '価格が9_999_999円を超えると出品できない' do
        @item.price = 99_999_999
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
    end
  end
end
