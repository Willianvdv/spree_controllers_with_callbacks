Spree::ProductsController.class_eval do
  include ControllerCallback
  use_callbacks_for :index
  use_callbacks_for :show
end
