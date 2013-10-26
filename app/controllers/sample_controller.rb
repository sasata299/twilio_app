class SampleController < ApplicationController
  def index
  end

  def call
    @call = TwilioUtil.client.account.calls.create(
      :from => '+815031540459',
      :to => "+81#{ENV['TO']}",
      :url => 'http://twilio-299.heroku.com/callback',
    )

    render text: 'done'
  end

  #<Say voice="woman">Please leave a message after the tone.</Say>
  #<Record maxLength="20"/>
  def callback
    xml = Builder::XmlMarkup.new(indent: 2)
    render :xml => xml.Response {
      xml.Say('Please leave a message after the tone.', voice: 'woman')
    }
  end
end
