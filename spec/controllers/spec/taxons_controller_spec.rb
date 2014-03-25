require 'spec_helper'

describe Spree::TaxonsController do
  let(:taxon) { create(:taxon) }

  before do
    Spree::TaxonsController.class_eval do
      set_callback :show, :after, Proc.new { @test_for_show = true }
    end
  end

  describe '.show' do
    it 'should assign test' do
      spree_get :show, id: taxon.permalink
      assert assigns(:test_for_show)
    end
  end
end
