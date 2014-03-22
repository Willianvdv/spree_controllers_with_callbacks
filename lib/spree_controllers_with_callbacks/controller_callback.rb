module ControllerCallback
  extend ActiveSupport::Concern

  included do
    include ActiveSupport::Callbacks

    define_callbacks :show
    define_callbacks :index
  end
end
