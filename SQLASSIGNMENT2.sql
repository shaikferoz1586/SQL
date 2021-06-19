--CREATE SCHEMA pizza_runner;
--SET search_path = pizza_runner;
SELECT * FROM dbo.runners

--DROP TABLE IF EXISTS runners;
CREATE TABLE runners (
  "runner_id" INTEGER,
  "registration_date" DATE
);
INSERT INTO runners
  ("runner_id", "registration_date")
VALUES
  (1, '2021-01-01'),
  (2, '2021-01-03'),
  (3, '2021-01-08'),
  (4, '2021-01-15');


--DROP TABLE IF EXISTS customer_orders;
CREATE TABLE customer_orders (
  "order_id" INTEGER,
  "customer_id" INTEGER,
  "pizza_id" INTEGER,
  "exclusions" VARCHAR(4),
  "extras" VARCHAR(4),
  "order_time" DATETIME
);

INSERT INTO customer_orders
  ("order_id", "customer_id", "pizza_id", "exclusions", "extras", "order_time")
VALUES
  ('1', '101', '1', '', '', '2020-01-01 18:05:02'),
  ('2', '101', '1', '', '', '2020-01-01 19:00:52'),
  ('3', '102', '1', '', '', '2020-01-02 12:51:23'),
  ('3', '102', '2', '', 'NULL', '2020-01-02 12:51:23'),
  ('4', '103', '1', '4', '', '2020-01-04 13:23:46'),
  ('4', '103', '1', '4', '', '2020-01-04 13:23:46'),
  ('4', '103', '2', '4', '', '2020-01-04 13:23:46'),
  ('5', '104', '1', 'null', '1', '2020-01-08 21:00:29'),
  ('6', '101', '2', 'null', 'null', '2020-01-08 21:03:13'),
  ('7', '105', '2', 'null', '1', '2020-01-08 21:20:29'),
  ('8', '102', '1', 'null', 'null', '2020-01-09 23:54:33'),
  ('9', '103', '1', '4', '1, 5', '2020-01-10 11:22:59'),
  ('10', '104', '1', 'null', 'null', '2020-01-11 18:34:49'),
  ('10', '104', '1', '2, 6', '1, 4', '2020-01-11 18:34:49');


--DROP TABLE IF EXISTS runner_orders;
CREATE TABLE runner_orders (
  "order_id" INTEGER,
  "runner_id" INTEGER,
  "pickup_time" VARCHAR(19),
  "distance" VARCHAR(7),
  "duration" VARCHAR(10),
  "cancellation" VARCHAR(23)
);

INSERT INTO runner_orders
  ("order_id", "runner_id", "pickup_time", "distance", "duration", "cancellation")
VALUES
  ('1', '1', '2020-01-01 18:15:34', '20km', '32 minutes', ''),
  ('2', '1', '2020-01-01 19:10:54', '20km', '27 minutes', ''),
  ('3', '1', '2020-01-02 00:12:37', '13.4km', '20 mins', 'NULL'),
  ('4', '2', '2020-01-04 13:53:03', '23.4', '40', 'NULL'),
  ('5', '3', '2020-01-08 21:10:57', '10', '15', 'NULL'),
  ('6', '3', 'null', 'null', 'null', 'Restaurant Cancellation'),
  ('7', '2', '2020-01-08 21:30:45', '25km', '25mins', 'null'),
  ('8', '2', '2020-01-10 00:15:02', '23.4 km', '15 minute', 'null'),
  ('9', '2', 'null', 'null', 'null', 'Customer Cancellation'),
  ('10', '1', '2020-01-11 18:50:20', '10km', '10minutes', 'null');


--DROP TABLE IF EXISTS pizza_names;
CREATE TABLE pizza_names (
  "pizza_id" INTEGER,
  "pizza_name" TEXT
);
INSERT INTO pizza_names
  ("pizza_id", "pizza_name")
VALUES
  (1, 'Meatlovers'),
  (2, 'Vegetarian');


--DROP TABLE IF EXISTS pizza_recipes;
CREATE TABLE pizza_recipes (
  "pizza_id" INTEGER,
  "toppings" TEXT
);
INSERT INTO pizza_recipes
  ("pizza_id", "toppings")
VALUES
  (1, '1, 2, 3, 4, 5, 6, 8, 10'),
  (2, '4, 6, 7, 9, 11, 12');


--DROP TABLE IF EXISTS pizza_toppings;
CREATE TABLE pizza_toppings (
  "topping_id" INTEGER,
  "topping_name" TEXT
);
INSERT INTO pizza_toppings
  ("topping_id", "topping_name")
VALUES
  (1, 'Bacon'),
  (2, 'BBQ Sauce'),
  (3, 'Beef'),
  (4, 'Cheese'),
  (5, 'Chicken'),
  (6, 'Mushrooms'),
  (7, 'Onions'),
  (8, 'Pepperoni'),
  (9, 'Peppers'),
  (10, 'Salami'),
  (11, 'Tomatoes'),
  (12, 'Tomato Sauce');
  
  
  SELECT * FROM runners
  SELECT * FROM runner_orders
  SELECT * FROM customer_orders
  SELECT * FROM pizza_names
  SELECT * FROM pizza_recipes
  SELECT * FROM pizza_toppings
  
-- 1. How many pizzas were ordered?
--2.How many unique customer orders were made?
--3.How many successful orders were delivered by each runner?
--4.How many of each type of pizza was delivered?
--5.How many Vegetarian and Meatlovers were ordered by each customer?
--6.What was the maximum number of pizzas delivered in a single order?
--7.For each customer, how many delivered pizzas had at least 1 change and how many had no changes?
--8.How many pizzas were delivered that had both exclusions and extras?
--9.What was the total volume of pizzas ordered for each hour of the day?
--1O.What was the volume of orders for each day of the week?


-- 1. How many pizzas were ordered?
SELECT  COUNT(ORDER_ID) FROM customer_orders

--2.How many unique customer orders were made?
SELECT COUNT( ORDER_ID)AS [UNIQE CUSTOMER] FROM customer_orders GROUP BY customer_id

SELECT COUNT( ORDER_ID)FROM customer_orders GROUP BY customer_id

--3.How many successful orders were delivered by each runner?

SELECT RUNNER_ID,COUNT(ORDER_ID) FROM runner_orders  
WHERE  isnull(cancellation,'') not in   ('Restaurant Cancellation','Customer Cancellation')
GROUP BY runner_id 

SELECT * FROM runner_orders

--4.How many of each type of pizza was delivered?
NOTSOLVED
SELECT * FROM customer_orders

SELECT DISTINCT(co.pizza_id),(co.order_id) as [co.pizzaDelivered] FROM customer_orders co
join  runner_orders ro on co.order_id = ro.order_id
WHERE  isnull(cancellation,'') not in   ('Restaurant Cancellation','Customer Cancellation')
GROUP BY co.pizza_id
order by co.pizza_id

SELECT distinct(runner_id),COUNT(order_id) FROM runner_orders  
WHERE  isnull(cancellation,'') not in   ('Restaurant Cancellation','Customer Cancellation')
GROUP BY runner_id 

--5.How many Vegetarian and Meatlovers were ordered by each customer?

SELECT * FROM customer_orders
select * from pizza_names

select distinct (customer_id),COUNT(CO.pizza_id),PO.pizza_name from customer_orders AS CO
JOIN pizza_names  AS PO ON PO.pizza_id = CO.pizza_id 
group by customer_id ,po.pizza_name

Select distinct CO.customer_id, PN.pizza_name, count (CO.order_id)as Pizzaordered from customer_orders CO
inner join pizza_names PN on CO.pizza_id = PN.pizza_id
Group by CO.customer_id,PN.pizza_name order by CO.customer_id


--6.What was the maximum number of pizzas delivered in a single order?

select distinct (pizza_id), max(exclusions),max (extras) as [max pizzas delivered]from customer_orders
---where exclusions= null 
group by pizza_id,order_id, exclusions,extras 

SELECT TOP 1 CUSTOMER_ID,COUNT (ORDER_ID) FROM customer_orders
GROUP BY customer_id
ORDER BY COUNT (ORDER_ID)DESC

select distinct (pizza_id), max(exclusions),max (extras) as [max pizzas delivered]from customer_orders
WHERE  isnull(extras,'') --not in   ('Restaurant Cancellation','Customer Cancellation
group by pizza_id,order_id, exclusions,extras 

SELECT * FROM customer_orders


--7.For each customer, how many delivered pizzas had at least 1 change and how many had no changes?
select * from runner_orders
select * from customer_orders

select distinct customer_id as co from customer_orders
Select  CO.customer_id, count (RO.order_id)from customer_orders CO
inner join runner_orders RO on CO.order_id = RO.order_id
where ISNULL(cancellation,'') not in ('Restaurant Cancellation','Customer cancellation')and 
 ISNULL(cast(extras as INT),'') > 0  or
ISNULL(cast(exclusions as INT),'')> 0
Group by CO.customer_id

Select  CO.customer_id, count (RO.order_id)from customer_orders CO
inner join runner_orders RO on CO.order_id = RO.order_id
where ISNULL(cancellation,'') not in ('Restaurant Cancellation','Customer cancellation')and 
cast(isnull(extras,'') as INT) > 0 or  
cast(isnull(exclusions,'') as INT)> 0
Group by CO.customer_id

--8.How many pizzas were delivered that had both exclusions and extras?
select * from customer_orders

select distinct (pizza_id) ,exclusions,extras from customer_orders
group by pizza_id, exclusions,extras

--9.What was the total volume of pizzas ordered for each hour of the day?

select * from runner_orders
select * from customer_orders
select *,Datepart(hour,pickup_time) from runner_orders

select  avg(pickup_time) from runner_orders

--1O.What was the volume of orders for each day of the week?
;with dailyorders as (
select customer_id, COUNT(order_id) as[daily received],CAST(order_time as DATE )
 as date from costumer_orders
 where CAST(order_time as date) between @previousdate @currentdate
 group by customer_id, CAST(order_time as date))
 select CAST(CAST(sum([daily received orders])as decimal(18,5)) as float/7 as [volume orders each day of week ] from dailyorders 

--B. Runner and Customer Experience
--1.How many runners signed up for each 1 week period? (i.e. week starts 2021-01-01)
--2.What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pickup the order?
--3.Is there any relationship between the number of pizzas and how long the order takes to prepare?
--4.What was the average distance travelled for each customer?
--5.What was the difference between the longest and shortest delivery times for all orders?
--6.What was the average speed for each runner for each delivery and do you notice any trend for these values?
--7.What is the successful delivery percentage for each runner?

--1.How many runners signed up for each 1 week period? (i.e. week starts 2021-01-01)
select * from runners
select * from runner_orders
select count(runner_id) from runners
select (runner_id) from runners
