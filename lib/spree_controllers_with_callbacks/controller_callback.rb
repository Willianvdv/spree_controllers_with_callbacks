module ControllerCallback
  extend ActiveSupport::Concern

  included do
    include ActiveSupport::Callbacks

    # The callbacks you can register on
    define_callbacks :show
    define_callbacks :index

    [:show, :index].each do |action|
      # Create a new method that calls the orinal method surrounded with
      # the run_callbacks
      define_method "#{action}_with_callbacks" do
        action_with_callbacks action
      end

      alias_method "#{action}_without_callbacks".to_sym, action
      alias_method action, "#{action}_with_callbacks".to_sym
    end
  end

  protected

  def action_with_callbacks action
    # Run the orignal method and preserve its return value
    r = nil
    run_callbacks action do
      r = self.send("#{action}_without_callbacks")
    end
    r
  end
end
