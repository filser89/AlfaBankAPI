# README

1. Clone this project
2. Save **master key** in the root folder
3. run `rails c` in terminal
4. create api sevvice
'api_service = ApiService.new(amount)'
amount - order amount
5. register order in Alfa-Bank system
`api_service.register_order`
this will return a link
6. navigate to the link and use test cards to pay:
https://pay.alfabank.ru/ecommerce/faq/index.html
7. after payment you can check order status
`api_service.check_order_status`
Will return a Hash with all the order data
