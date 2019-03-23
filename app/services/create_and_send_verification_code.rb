class CreateAndSendVerificationCode
  attr_accessor :client, :user

  def initialize(user)
    @client = Twilio::Client.new
    @user = user
  end

  def call
    otp_code = generate_otp_code
    Otpcode
      .where(user: user).first_or_initialize.tap do |c|
        c.otp_code = otp_code
        c.expire_at = Time.now + 5 * 60
        c.save!
      end

    client.send(otp_code, user.phone_number)
  end

  def generate_otp_code
    rand.to_s[2..8]
  end
end