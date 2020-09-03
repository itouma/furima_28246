require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '新規出品商品登録#new' do
    before do
      @item = FactoryBot.build(:item)
    end

    it 'nameとtext、priceとimage、category_idとitem_status_idとcost_burden_idとprefecture_idとship_date_idが存在すれば登録できること' do
      expect(@item).to be_valid
    end

    # #########nameのテストコード#########
    it 'nameが空では登録できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end


    # ##########textのテストコード#########
    it 'textが空では登録できないこと' do
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("説明を入力してください")
    end

    # ##########imageのテストコード#########
    it 'imageが空では登録できないこと' do
      @item.image = nil
      # binding.pry
      @item.valid?
      expect(@item.errors.full_messages).to include("画像を入力してください")
    end

    # ##########priceのテストコード#########
    it 'priceが空では登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("価格を入力してください")
    end

    it 'priceが299以下、10000000以上は登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('価格の範囲内で設定してください')
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('価格の範囲内で設定してください')
    end

    # ##########category_idのテストコード#########
    it 'category_idが空では登録できないこと' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
    end

    it 'category_idが0では登録できないこと' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
    end

    # ##########item_status_idのテストコード#########
    it 'item_status_idが空では登録できないこと' do
      @item.item_status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('商品の状態を選択してください')
    end

    it 'item_status_idが0では登録できないこと' do
      @item.item_status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('商品の状態を選択してください')
    end

    # ########cost_burden_idのテストコード############
    it 'cost_burden_idが空では登録できないこと' do
      @item.cost_burden_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('配送負担を選択してください')
    end

    it 'cost_burden_idが0では登録できないこと' do
      @item.cost_burden_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('配送負担を選択してください')
    end

    # ##########family_name_kanaのテストコード#########
    it 'prefecture_idが空では登録できないこと' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('都道府県を選択してください')
    end

    it 'prefecture_idが0では登録できないこと' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('都道府県を選択してください')
    end

    # ##########ship_date_idのテストコード#########
    it 'ship_date_idが空では登録できないこと' do
      @item.ship_date_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
    end

    it 'ship_date_idが0では登録できないこと' do
      @item.ship_date_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
    end
  end
end
