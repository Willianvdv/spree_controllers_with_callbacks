describe Spree::ProductsController do
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
      get :index
      assert assigns(:test)
    end
  end

  describe '.show' do
    get :show
    assert assigns(:test)
  end
end
