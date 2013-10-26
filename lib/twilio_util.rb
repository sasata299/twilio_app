module TwilioUtil
  def self.account_sid
    'AC74d7b150864b35221d287f0457cf4c33'
  end

  def self.auth_token
    '937fc56685f75d8d7888cd7193e8c398'
  end

  def self.client
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end
