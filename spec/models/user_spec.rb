require 'rails_helper'

RSpec.describe User, type: :model do

  describe "名前の長さ" do
    let(:user) { FactoryBot.build(:user, name: nil)}
    context "１１文字の以上の場合" do
      it "は長すぎる事" do
        user.name = "12345678900"
        user.valid?
        expect(user.errors[:name]).to include("は10文字以内で入力してください")
      end
    end

    context "８文字の場合" do
      it "は有効である事" do
        user.name = "12345678"
        expect(user).to be_valid
      end
    end
  end

  describe "Passwordの長さ" do
    let(:user){ FactoryBot.build(:user)}

    context "３文字以下の場合" do
      it "は短すぎる事" do
        user.password = "abc"
        user.valid?
        expect(user.errors[:password]).to include("は4文字以上で入力してください")
      end
    end

    context "21文字以上の場合" do
      it "長すぎる事" do
          user.password = "itistoolongitistoolongitistoolongitistoolongitistoolongitistoolongitis"
          user.valid?
          expect(user.errors[:password]).to include("は20文字以内で入力してください")
      end
    end

    context "5文字の場合" do
      it "は有効である事" do
        user.password = "abcde"
        expect(user).to be_valid
      end
    end
  end

  describe "Presence テスト" do
    let(:user) { FactoryBot.build(:user)}

    context "名前がない" do
      it "は無効である事" do
        user.name = nil
        user.valid?
        expect(user.errors[:name]).to include("を入力してください")
      end
    end

    context "Emailがない" do
      it "は無効である事" do
        user.email = nil
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end
    end

    context "Passwordがない" do
      it "は無効である事" do
        user.password = nil
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
      end
    end
  end

  describe "Uniqueness テスト" do
    context "emailが重複している場合" do
        it "無効である事" do
          FactoryBot.create(:user,email:"test@ex.com")
          user = FactoryBot.build(:user,email:"test@ex.com")
          user.valid?
          expect(user.errors[:email]).to include("はすでに存在します")
        end
    end
  end
end