# frozen_string_literal: true

module Twilio
  class Client
    attr_accessor :client

    def initialize
      @client = Twilio::REST::Client.new
    end

    # def valid_number(phone_number)
    #   response = client.lookups.v1.phone_numbers(phone_number).
    #     fetch(type: 'phone_number')
    #   response.phone_number.presetnt?
    # end

    def send(message, to)
      send_message = {
        to: "+#{to}",
        from: ENV['TWILIO_NUMBER'],
        body: "Wellcome To hoshyaar.\nPlease enter #{message} security code for phone verification."
      }
      client.messages.create(send_message)
      # client.api.account.messages.create(message)
    end
  end
end