-- 1. Top 3 customers based on orders
select 
c.first_name,
c.last_name,
sum(o.total_amount) total_order_amount
from customer as c
join orders o on o.customer_id = c.customer_id
group by c.customer_id
order by total_order_amount desc
limit 3
;

-- 2. average order value for each customer
select
c.first_name,
c.last_name,
avg(total_amount) average_order
from customer c
join orders o on c.customer_id = o.customer_id
group by c.customer_id
;

-- 3. employees with >4 resolved ticket support
select
e.first_name,
e.last_name,
count(s.ticket_id)
from employees e
join supporttickets s on e.employee_id = s.employee_id
where s.status = 'resolved'
group by e.employee_id
having count(s.ticket_id)>4
;

-- 4. product yang belum pernah dipesan
select
products.product_name
from products
left join orderdetails od on od.product_id = products.product_id
where od.order_id is null
;

-- 5. total revenue
select
sum(quantity*unit_price)
from orderdetails
;

-- 6. harga rata-rata tiap kategori produk
with cte_avg_price as (
select
category,
avg(price) rerata
from products
group by category
)
select * from cte_avg_price where rerata>500
;

-- 7. pelanggan yang pernah order melebih 1000
select * 
from customer
where 
customer_id in 
(select customer_id
from orders
where total_amount > 1000
)
;
