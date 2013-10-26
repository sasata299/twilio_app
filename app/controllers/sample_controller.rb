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
      xml.Gather(action: 'http://twilio-299.heroku.com/receive', method: 'GET', numDigits: 1, timeout: 10) do
        xml.Say('番号を入力してください', voice: 'woman', language: 'ja-JP')
      end
      xml.Say('何も入力されませんでした', voice: 'woman', language: 'ja-JP')
    }
  end

  def receive
    xml = Builder::XmlMarkup.new(indent: 2)
    render :xml => xml.Response {
      xml.Say("あなたが押したのは #{params[:Digits]} です", voice: 'woman', language: 'ja-JP')
    }
  end
end
