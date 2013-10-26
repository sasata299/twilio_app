class SampleController < ApplicationController
  def index
    p TwilioUtil.client
    render text: 'test'
  end
end
