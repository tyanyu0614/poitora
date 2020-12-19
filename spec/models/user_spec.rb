require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '確認用パスワードが空では登録できない' do
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'パスワードと確認用パスワードが一致しないと登録できない' do
      @user.password_confirmation = '111111c'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが半角英字のみだとユーザー登録できない' do
      @user.password = 'qqqqqqq'
      @user.password_confirmation = 'qqqqqqq'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordが全角だとユーザー登録できない' do
      @user.password = '１１１１１１A'
      @user.password_confirmation = '１１１１１１A'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordは6文字以上でなければ登録できない' do
      @user.password = '1111e'
      @user.password_confirmation = '1111e'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'メールアドレスに@が含まれていないとと登録できない' do
      @user.email = 'tttttttttt'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it '重複したメールアドレスがある場合は登録ができない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
  end
end
