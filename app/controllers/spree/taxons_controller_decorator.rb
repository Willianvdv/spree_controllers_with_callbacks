Spree::TaxonsController.class_eval do
  include ControllerCallback
  use_callbacks_for :show
end
