class CreateAndSendVerificationCode
  attr_accessor :client, :user

  def initialize(user)
    @client = Twilio::Client.new
    @user = user
  end

  def call
    opt_code = generate_opt_code
    Optcode
      .where(user: user).first_or_initialize.tap do |c|
        c.opt_code = opt_code
        c.expire_at = Time.now + 5 * 60
        c.save!
      end

    client.send(opt_code, user.phone_number)
  end

  def generate_opt_code
    rand.to_s[2..8]
  end
end