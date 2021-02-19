require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    let!(:product){ create(:product) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:color_name) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:image) }

    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(100) }

    it { is_expected.to validate_inclusion_of(:zodiac_sign).in_array(Product::ZODIAC_SIGNS)}

    it { is_expected.to validate_attached_of(:image) }
    it { is_expected.to validate_content_type_of(:image).allowing('image/png', 'image/jpeg') }
    it { is_expected.to validate_content_type_of(:image).rejecting('text/plain', 'text/xml') }

    describe 'price' do
      context 'when price is a decimal' do
        it 'entity should be valid' do
          product.price = 458.67

          expect(product).to be_valid
          expect(product.price).to eql(458.67)
        end
      end

      context 'when price is a negative number' do
        it 'entity should not be valid' do
          product.price = -34
          expect(product).to_not be_valid
        end
      end

      context 'when price is bigger that max limit' do
        it 'entity should not be valid' do
          product.price = 1000000
          expect(product).to_not be_valid
        end
      end

      context 'when price is equal to 0' do
        it 'entity should not be valid' do
          product.price = 0
          expect(product).to_not be_valid
        end
      end

      context 'when price is not a numbr' do
        it 'entity should not be valid' do
          product.price = 'price23'
          expect(product).to_not be_valid
        end
      end
    end
  end

  describe 'serializable' do
    let!(:product) { create(:product) }

    context 'when serializing with ProductSerializer' do
      let(:serializable_hash) { ProductSerializer.new(product).serializable_hash }

      it 'serializes product with the correct attributes' do
        expect(serializable_hash.keys).to eql(%i[id name description color_name zodiac_sign price image])
      end
    end
  end

  describe '.search' do
    let!(:first_product){ create(:product, color_name: 'red', zodiac_sign: Product::ZODIAC_SIGNS.first) }
    let!(:second_product){ create(:product, color_name: 'red', zodiac_sign: Product::ZODIAC_SIGNS.second) }
    let!(:third_product){ create(:product, color_name: 'blue', zodiac_sign: Product::ZODIAC_SIGNS.third) }

    context 'when we search by colour name only' do
      params = { color_name: 'red' }

      it 'returns products filtered by colour name' do
        expect(described_class.search(params).pluck(:id)).to eq([first_product.id, second_product.id])
      end
    end

    context 'when we search by zodiac sign only' do
      params = { zodiac_sign: Product::ZODIAC_SIGNS.third }

      it 'returns products filtered by zodiac sign' do
        expect(described_class.search(params).pluck(:id)).to eq([third_product.id])
      end

    end

    context 'when we search by colour name and zodiac sign' do
      params = { colour_name: 'red', zodiac_sign: Product::ZODIAC_SIGNS.second }

      it 'returns products filtered by colour name' do
        expect(described_class.search(params).pluck(:id)).to eq([second_product.id])
      end
    end
  end
end
