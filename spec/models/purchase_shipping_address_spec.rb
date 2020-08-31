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
      expect(@purchase_shipping_address.errors.full_messages).to include("Token can't be blank")
    end

    # ##########cityのパターン#############
    it 'cityが空だと保存できないこと' do
      @purchase_shipping_address.city = ''
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("City can't be blank")
    end

    # ##########city_numberのパターン#############
    it 'city_numberが空だと保存できないこと' do
      @purchase_shipping_address.city_number = ''
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("City number can't be blank")
    end

    # ##########phone_numberのパターン#############
    it 'phone_numberが空だと保存できないこと' do
      @purchase_shipping_address.phone_number = ''
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberがハイフンが不要であること' do
      @purchase_shipping_address.phone_number = '111-111-12'
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include('Phone number is invalid. Include hyphen(-)')
    end

    # ##########postal_codeのパターン#############
    it 'postal_codeが空だと保存できないこと' do
      @purchase_shipping_address.postal_code = ''
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_shipping_address.postal_code = '1234567'
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end

    # ##########prefecture_idのパターン#############
    it 'prefecture_idを選択していないと保存できないこと' do
      @purchase_shipping_address.prefecture_id = 0
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include('Prefecture Select')
    end
  end
end
