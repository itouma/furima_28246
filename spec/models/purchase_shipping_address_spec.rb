require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  describe '寄付情報の保存' do
    before do
      @purchase_shipping_address = FactoryBot.build(:purchase_shipping_address)
    end

    it 'cityとcity_numberとphone_numberとpostal_codeとprefecture_idとtokenが正しく入っていれば保存できる' do
      expect(@purchase_shipping_address).to be_valid
    end

    # ##########tokenのパターン#############
    it 'tokenが空だと保存できないこと' do
      @purchase_shipping_address.token = ''
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("クレジット情報を入力してください")
    end

    # ##########cityのパターン#############
    it 'cityが空だと保存できないこと' do
      @purchase_shipping_address.city = ''
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("市区町村を入力してください")
    end

    # ##########city_numberのパターン#############
    it 'city_numberが空だと保存できないこと' do
      @purchase_shipping_address.city_number = ''
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("番地を入力してください")
    end

    # ##########phone_numberのパターン#############
    it 'phone_numberが空だと保存できないこと' do
      @purchase_shipping_address.phone_number = ''
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("電話番号を入力してください")
    end

    it 'phone_numberがハイフンが不要であること' do
      @purchase_shipping_address.phone_number = '111-111-12'
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include('電話番号のハイフンは不要です')
    end

    # ##########postal_codeのパターン#############
    it 'postal_codeが空だと保存できないこと' do
      @purchase_shipping_address.postal_code = ''
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("郵便番号を入力してください",'郵便番号のハイフンをつけてください')
    end

    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_shipping_address.postal_code = '1234567'
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include('郵便番号のハイフンをつけてください')
    end

    # ##########prefecture_idのパターン#############
    it 'prefecture_idを選択していないと保存できないこと' do
      @purchase_shipping_address.prefecture_id = 0
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include('都道府県を選択してください')
    end
  end
end
