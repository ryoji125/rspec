require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(email:"test@user", password:"password")
  end

  describe 'バリデーション' do
    it 'emailとpasswordどちらも値が設定されていれば、OK' do
      expect(@user.valid?).to eq(true)
    end

    it 'emailが設定されてなければNG' do
      @user.email = nil
      expect(@user.valid?).to eq(false)
    end

    it 'passwordが設定されてなければNG' do
      @user.password = nil
      expect(@user.valid?).to eq(false)
    end

    it 'emailが重複していた際にNG' do
      User.create(email:"test@user", password:"password")
      @user.save
      expect(@user.valid?).to eq(false)
    end
  end
end