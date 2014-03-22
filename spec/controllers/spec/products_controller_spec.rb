require 'spec_helper'

describe Spree::ProductsController do
  let(:product) { create(:product) }

  before do
    Spree::ProductsController.class_eval do
      set_callback :show, :after, Proc.new { @test_for_show = true }
      set_callback :index, :after, Proc.new { @test_for_index = true }
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
