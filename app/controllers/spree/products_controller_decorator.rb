Spree::ProductsController.class_eval do
  include ControllerCallback

  def index_with_callbacks
    r = nil
    run_callbacks :index do
      r = index_without_callbacks
    end
    r
  end

  alias_method :index_without_callbacks, :index
  alias_method :index, :index_with_callbacks
end
