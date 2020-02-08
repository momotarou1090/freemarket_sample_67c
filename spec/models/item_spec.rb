require 'rails_helper'

describe Item do

  describe '#create' do
    # 1.nameが空だとitemの登録ができない
    it "is invalid without a name" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    # 2.priceが空だとitemの登録ができない
    it "is invalid without a price" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    # 3.condition_idが空だとitemの登録ができない
    it "is invalid without a condition_id" do
      item = build(:item, condition_id: "")
      item.valid?
      expect(item.errors[:condition_id]).to include("can't be blank")
    end

    # 4.postage_idが空だとitemの登録ができない
    it "is invalid without a postage_id" do
      item = build(:item, postage_id: "")
      item.valid?
      expect(item.errors[:postage_id]).to include("can't be blank")
    end

    # 5.region_idが空だとitemの登録ができない
    it "is invalid without a region_id" do
      item = build(:item, region_id: "")
      item.valid?
      expect(item.errors[:region_id]).to include("can't be blank")
    end

    # 6.shipping_date_idが空だとitemの登録ができない
    it "is invalid without a shipping_date_id" do
      item = build(:item, shipping_date_id: "")
      item.valid?
      expect(item.errors[:shipping_date_id]).to include("can't be blank")
    end

    # 7.descriptionが空だとitemの登録ができない
    it "is invalid without a description" do
      item = build(:item, description: "")
      item.valid?
      expect(item.errors[:description]).to include("can't be blank")
    end

    # 8.seller_idが空だとitemの登録ができない
    it "is invalid without a seller_id" do
      item = build(:item, seller_id: "")
      item.valid?
      expect(item.errors[:seller_id]).to include("can't be blank")
    end

    # 9.statusが空だとitemの登録ができない
    it "is invalid without a status" do
      item = build(:item, status: "")
      item.valid?
      expect(item.errors[:status]).to include("can't be blank")
    end

    # 10.category_idが空だとitemの登録ができない
    it "is invalid without a category_id" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end

    # 11.condition_idが空だとitemの登録ができない
    it "is invalid without a condition_id" do
      item = build(:item, condition_id: "")
      item.valid?
      expect(item.errors[:condition_id]).to include("can't be blank")
    end

    # 12.buyer_id以外に、空のカラムがなければitemの登録ができる
    it "is valid with condition_id" do
      item = build(:item)
      expect(item).to be_valid
    end
        
  end
end