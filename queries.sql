use dbms;

-- query 1

create view cartTotal as select P.customer_id as Username, P.Name, cartTotal(P.customer_id) as CartTotal
from customer P;

select * from cartTotal;

-- query 2

create view orderTotal as select P.customer_id as Username, P.Name, O.orders_id as OrderNumber, orderTotal(O.orders_id) as PriceBeforeDiscount
from customer P inner join orders O
on O.customer_id=P.customer_id;

select * from orderTotal;

create view orderDiscount as select V.Username,V.Name,V.OrderNumber,V.PriceBeforeDiscount,D.discount_id as DiscountCode,
V.PriceBeforeDiscount-(IF(V.PriceBeforeDiscount>=D.minPrice,1,0)*V.PriceBeforeDiscount*D.percentageOff*0.01) as PriceAfter
from orderTotal V inner join discount D inner join orders O
on O.discount_id=D.discount_ID and O.orders_id=V.OrderNumber;

select * from orderDiscount;

-- query 3

select date_format(timestamp, '%Y-%m') as day_of_order, count(orders_id) as number_of_orders
from Orders
group by day_of_order
order by day_of_order asc;

-- query 4

select S.supplier_id,S.name,P.product_id,P.productname,P.productdescription,P.MRP
from supplier S inner join product P
on P.supplier_id=S.supplier_id
where S.supplier_id=34 and P.quantity<5;

-- query 5

select V.OrderNumber
from orderdiscount V inner join discount D
on V.discountCode=D.discount_id
where D.percentageOff between 10 and 50 and V.PriceBeforeDiscount>50000;

-- query 6

select P.product_id, S.name, sum(C.quantity) as quantity
from Product P inner join Supplier S inner join OrdersContent C
on P.supplier_id=S.supplier_id and C.product_id=P.product_id 
where S.supplier_id = 34
group by P.product_id
order by quantity desc
limit 5;

-- query 7

select V.username, V.ordernumber, V.priceafter, temp.avrg as Average,V.priceafter-temp.avrg as difference, (V.priceafter-temp.avrg)/sqrt(temp.var) as sigmadev
from orderdiscount V, (select avg(V1.priceafter) as avrg, variance(V1.priceafter) as var from orderdiscount V1) as temp
order by sigmadev desc;

-- query 8

select V.username, V.ordernumber, V.priceafter
from orderdiscount V
where V.ordernumber in(
select V2.ordernumber from orderdiscount V2
where exists(select V3.ordernumber from orderdiscount V3 where V3.priceafter>30000 and V2.ordernumber=V3.ordernumber)
and not exists (select V1.ordernumber from orderdiscount V1 inner join orderscontent C inner join product P
on V1.ordernumber=C.orders_id and P.product_id=C.product_id
where P.productcategory='a' and V2.ordernumber=V1.ordernumber));



-- query 9
-- Find the suppliers who supply some 'perferendis' and some 'laboeiosam'

SELECT S.Name
FROM Product P inner join Supplier S
	ON P.supplier_id=S.supplier_id
    WHERE P.ProductName='perferendis' 
    AND EXISTS(
    SELECT P2.product_id
		FROM Product P2, Supplier S2
		WHERE P2.ProductName='laboriosam' AND S2.supplier_id=S.supplier_id AND 
        P2.supplier_id=P.supplier_id
    );

-- query 10
-- Show products and their respective suppliers, if the product was bought and transaction was made through credit card or debit card
SELECT P.ProductName, P.supplier_id
FROM Product P
WHERE NOT EXISTS (SELECT C.customer_id 
		FROM Customer C inner join Orders O
		ON C.customer_id=O.customer_id WHERE (O.modeOfPayment='CreditCard' OR O.modeOfPayment='DebitCard')
			AND NOT EXISTS(SELECT Q.orders_id
					FROM OrdersContent Q, Orders O2
					WHERE Q.Orders_id=O2.orders_id AND O2.orders_id=O.orders_id))

