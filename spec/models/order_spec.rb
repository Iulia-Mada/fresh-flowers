require 'rails_helper'

RSpec.describe Order, type: :model do
  let!(:order) { create(:order) }

  describe 'validations' do
    it { should define_enum_for(:status).with(Order.statuses.keys) }

    context 'when email not valid' do
      it 'does not save the order' do
        order.update(email: 'invalid email')
        expect(order.errors.messages[:email]).to eql ['is invalid']
      end
    end
  end
end
