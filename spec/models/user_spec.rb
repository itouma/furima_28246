require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nicknameとemail、passwordとpassword_confirmation、birthdayとfirst_nameとfamily_nameとfirst_name_kanaとfamily_name_kanaが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    # ##########nicknameのテストコード#########
    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      binding.pry
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end

    
    # ##########emailのテストコード#########
    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end

    it 'emailが重複していると登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end

    it 'emailに@が1つもないと登録できないこと' do
      @user.email = 'aaagmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'emailに@が必ず1つあれば登録できること' do
      @user.email = 'a@aagmail.com'
      expect(@user) .to be_valid
    end

    # ##########passwordのテストコード#########
    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください", 'パスワード半角英数字で入力してください')
    end

    it 'passwordが半角英数字を折り混ぜない場合は登録できないこと' do
      @user.password = 'あいうえおか'
      @user.password_confirmation = 'あいうえおか'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード半角英数字で入力してください')
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード半角英数字で入力してください')
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード半角英数字で入力してください')
    end

    it 'passwordが5文字以下だと登録できないこと' do
      @user.password = '1234a'
      @user.password_confirmation = '1234a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが半角英数字を折り混ぜかつ、6文字以上であれば登録できること' do
      @user.password = '12345a'
      @user.password_confirmation = '12345a'
      expect(@user) .to be_valid
    end

    # ##########password_confirmationのテストコード#########
    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    # ##########birthdayのテストコード#########
    it 'birthdayが空では登録できないこと' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("生年月日を入力してください")
    end

    # ##########first_nameのテストコード#########
    it 'first_nameが空では登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("名を入力してください", '名を全角で入力してください')
    end

    it 'first_nameが全角以外は登録できないこと' do
      @user.first_name = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('名を全角で入力してください')
      @user.first_name = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('名を全角で入力してください')
      @user.first_name = 'ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors.full_messages).to include('名を全角で入力してください')
    end

    it 'first_nameが全角だと登録できること' do
      @user.first_name = 'あア亜１ａＺ'
      expect(@user) .to be_valid
    end

    # ##########family_nameのテストコード#########
    it 'family_nameが空では登録できないこと' do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("姓を入力してください", '姓を全角で入力してください')
    end

    it 'family_nameが全角以外は登録できないこと' do
      @user.family_name = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('姓を全角で入力してください')
      @user.family_name = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('姓を全角で入力してください')
      @user.family_name = 'ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors.full_messages).to include('姓を全角で入力してください')
    end

    it 'family_nameが全角だと登録できること' do
      @user.family_name = 'あア亜１ａＺ'
      expect(@user) .to be_valid
    end

    # ########first_name_kanaのテストコード############
    it 'first_name_kanaが空では登録できないこと' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("名カナを入力してください", '名カナをカタカナの全角で入力してください')
    end

    it 'first_name_kanaがカタカナ全角以外は登録できないこと' do
      @user.first_name_kana = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('名カナをカタカナの全角で入力してください')
      @user.first_name_kana = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('名カナをカタカナの全角で入力してください')
      @user.first_name_kana = 'ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors.full_messages).to include('名カナをカタカナの全角で入力してください')
      @user.first_name_kana = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include('名カナをカタカナの全角で入力してください')
    end

    it 'first_name_kanaがカタカナ全角だと登録できること' do
      @user.first_name_kana = 'アイウエオ'
      expect(@user) .to be_valid
    end

    # ##########family_name_kanaのテストコード#########
    it 'family_name_kanaが空では登録できないこと' do
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("姓カナを入力してください", '姓カナをカタカナの全角で入力してください')
    end

    it 'family_name_kanaがカタカナ全角以外は登録できないこと' do
      @user.family_name_kana = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('姓カナをカタカナの全角で入力してください')
      @user.family_name_kana = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('姓カナをカタカナの全角で入力してください')
      @user.family_name_kana = 'ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors.full_messages).to include('姓カナをカタカナの全角で入力してください')
      @user.family_name_kana = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include('姓カナをカタカナの全角で入力してください')
      @user.family_name_kana = '１２３ｚ'
      @user.valid?
      expect(@user.errors.full_messages).to include('姓カナをカタカナの全角で入力してください')
    end

    it 'family_name_kanaがカタカナ全角だと登録できること' do
      @user.family_name_kana = 'アイウエオ'
      expect(@user) .to be_valid
    end
  end
end
