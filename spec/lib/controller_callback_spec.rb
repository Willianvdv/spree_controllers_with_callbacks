require 'spec_helper'

class TestController
  def show
    return :return_value
  end

  def index; end
end

TestController.class_eval do
  include ControllerCallback
  attr_reader :test_for_show

  set_callback :show, :after, Proc.new { @test_for_show = true }
end

describe ControllerCallback do
  subject { TestController.new }

  describe 'after callbacks' do
    it 'should have assigned test_for_show' do
      subject.show
      expect(subject.test_for_show).to be_true
    end

    it 'should return the original return value' do
      return_value = subject.show
      expect(return_value).to eq(:return_value)
    end
  end
end
