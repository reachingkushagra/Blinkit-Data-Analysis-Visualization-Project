select 
orders.order_id,
customer.customer_id,
orders.delivery_partner_id,
order_item.product_id,
customer_feedbacks.feedback_id,
customer.area,
customer.customer_name,
customer.customer_segment,
products.product_name,
products.category,
products.price,
order_item.quantity,
round(products.price*order_item.quantity,2)Value,
delivery.promised_time,
delivery.actual_time,
delivery.reasons_if_delayed,
customer_feedbacks.rating,
customer_feedbacks.feedback_category,
customer_feedbacks.feedback_text,
customer_feedbacks.sentiment,
DATE(orders.order_date) Date

from
orders, customer, order_item, products,customer_feedbacks,delivery

where 
orders.customer_id=customer.customer_id
and orders.order_id=delivery.order_id
and ROUND(order_item.order_id)= orders.order_id
and order_item.product_id = round(products.product_id)
and customer_feedbacks.customer_id = orders.customer_id;