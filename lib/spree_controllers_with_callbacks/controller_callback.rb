module ControllerCallback
  extend ActiveSupport::Concern

  included do
    include ActiveSupport::Callbacks

    define_callbacks :show
    define_callbacks :index
  end

  protected

  def action_with_callbacks action
    r = nil
    run_callbacks action do
      r = self.send("#{action}_without_callbacks")
    end
    r
  end
end
