require "spec_helper"

class User < ActiveRecord::Base
  include EnumI18n
  enum sex:  { male: 0, female: 1}
end

RSpec.describe ActiveRecord::EnumI18n do
  let(:locales_dir) { 'spec/locales/models' }
  before do
    I18n.load_path << [[locales_dir + '/user.yml']]
    I18n.load_path << [[locales_dir + '/user/property.yml']]
  end

  describe "#set_enum_text" do

    context 'when unset enumelize' do
      let(:instance) { User.new }
      let(:methods) { instance.methods - [:set_enum_text] }

      it '動的メソッドは作成されない' do
        expect(instance.defined_enums).to be_empty
        expect(methods).not_to include(match(/_text/))
      end
    end

    context 'when set enumelize' do
      let(:instance) { User.new }
      let(:methods) { instance.methods }

      it 'findしたインスタンスに対して動的メソッドが作成される' do
        instance.defined_enums.keys.each do |key|
          expect(methods).to include("#{key}_text".to_sym)
        end
      end
      it 'Enumの値に対する翻訳が取得できる。' do
        expect(instance.sex_text).to eq 'Female'
      end

      it 'scopeを指定した場合、指定scope配下を見に行く' do
        expect(instance.sex_text('user.sex')).to eq 'Female'
      end
    end

    context 'and relation instances' do
      let(:instances) { [User.new, User.new] }
      let(:methods) { instances.first.methods }

      it 'リレーションの各インスタンスに対して動的メソッドが作成される' do
        instances.each do |instance|
          instance.defined_enums.keys.each do |key|
            expect(methods).to include("#{key}_text".to_sym)
          end
        end
      end

      it 'Enumの値に対する翻訳が取得できる。' do
        instances.each do |instance|
          expect(instance.sex_text).to eq 'Female'
        end
      end
    end

    context 'when use with model defined as module' do
      let(:instance) { create :user_property }
      let(:methods) { instance.methods }

      it do
        instance.defined_enums.keys.each do |key|
          expect(methods).to include("#{key}_text".to_sym)
        end
      end

      it { expect(instance.active_text).to eq "Active" }
    end
  end
end
