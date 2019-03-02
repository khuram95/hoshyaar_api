class CreateAndSendVerificationCode
  attr_accessor :client, :user

  def initialize(user)
    @client = Twilio::Client.new
    @user = user
  end

  def call
    security_code = generate_security_code
    PhoneSecurityCode
      .where(user: user).first_or_initialize.tap do |c|
        c.security_code = security_code
        c.expire_at = Time.now + 5 * 60
        c.save!
      end

    client.send(security_code, user.phone_number)
  end

  def generate_security_code
    rand.to_s[2..8]
  end
end