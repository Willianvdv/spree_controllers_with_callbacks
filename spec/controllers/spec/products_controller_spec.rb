require 'spec_helper'

describe Spree::ProductsController do
  let(:product) { create(:product) }

  before do
    Spree::ProductsController.class_eval do
      set_callback :show, :after, :assign_test_for_show
      set_callback :index, :after, :assign_test_for_index

      private

      def assign_test_for_show
        @test_for_show = true
      end

      def assign_test_for_index
        @test_for_index = true
      end
    end
  end

  describe '.index' do
    it 'should assign test' do
      spree_get :index
      assert assigns(:test_for_index)
    end
  end

  describe '.show' do
    it 'should assign test' do
      spree_get :show, id: product.slug
      assert assigns(:test_for_show)
    end
  end
end
