# frozen_string_literal: true

# &expirationDate=2014-09-08T14:14:14
require 'rest-client'
class ApiService
  def initialize(amount)
    @user_name = Rails.application.credentials.dig(:alfa_bank, :login)
    @password = Rails.application.credentials.dig(:alfa_bank, :password)
    @url = 'https://web.rbsuat.com/ab/rest'
    @amount = amount
    @return_url = 'https://pereplan-one.ru/'
  end

  def register_order
    url = "#{@url}/register.do?userName=#{@user_name}&password=#{@password}&amount=#{@amount}&orderNumber=#{set_order_number}&returnUrl=#{@return_url}"
    url += '&expirationDate=2022-04-20T00:00:00'
    # url += '&sessionTimeoutSecs=50000'
    order = JSON.parse(RestClient.post(url, {}.to_json))
    @order_id = order['orderId']
    @form_url = order['formUrl']
  end

  def check_order_status
    url = "#{@url}/getOrderStatus.do?userName=#{@user_name}&password=#{@password}&orderId=#{@order_id}"
    res = JSON.parse(RestClient.post(url, {}.to_json))
    p 'RESPONSE:', res
  end

  def set_order_number
    @order_number = "pereplan-#{DateTime.now.to_i}"
  end
end
