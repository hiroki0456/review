require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order = FactoryBot.build(:order_form)
  end
  context '成功する' do
    it '全ての条件を満たしている' do
      expect(@order).to be_valid
    end
  end

  context '失敗する' do
    it 'tokenが空だと登録できない' do
      @order.token = ' '
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end

    it 'postal_codeが空だと登録できない' do
      @order.postal_code = ' '
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'cityが空だと登録できない' do
      @order.city = ' '
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end

    it 'phone_numberが空だと登録できない' do
      @order.phone_number = ' '
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end
  end
end
