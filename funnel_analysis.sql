use ecommerce_project;

select count(*) from ecommerce_funnel;

-- user at each stage
select event,
count(distinct user_id) as users 
from ecommerce_funnel
group by event;

 -- converstion rate 
 select round(
 count(distinct case when 
 event = 'transaction' then user_id end) * 100.0 / 
 count(distinct case when event = 'view' then user_id end), 2)
 as converstion_rate
 from ecommerce_funnel;
 
 -- cart converstion
 select round(
 count(distinct case when event = 'transaction' then user_id end) * 100.0 /
 count(distinct case when event = 'addtocart' then user_id end), 2)
 as cart_converstion
 from ecommerce_funnel;
 
 -- drop-off
 select 
 count(distinct case when event = 'view' then user_id end) as view_users,
 count(distinct case when event = 'addtocart' then user_id end) as cart_users,
 count(distinct case when event = 'transaction' then user_id end) as purchase_users
 from ecommerce_funnel;
 















