require 'spec_helper'

describe Spree::ProductsController do
  let(:product) { create(:product) }

  before do
    Spree::ProductsController.class_eval do
      set_callback :show, :after, :assign_test
      set_callback :index, :after, :assign_test

      private

      def assign_test
        @test = true
      end
    end
  end

  describe '.index' do
    it 'should assign test' do
      spree_get :index
      assert assigns(:test)
    end
  end

  describe '.show' do
    it 'should assign test' do
      spree_get :show, id: product.slug
      assert assigns(:test)
    end
  end
end
