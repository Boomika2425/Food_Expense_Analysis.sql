CREATE DATABASE food_expense_analysis;
USE food_expense_analysis;

create table food_expenses(
expense_id int auto_increment primary key,
expense_date date,
category varchar(40),
amount decimal(10,2));

INSERT INTO food_expenses (expense_date, category, amount) VALUES
('2026-01-01', 'Groceries', 450),
('2026-01-01', 'Snacks and tea', 60),
('2026-01-02', 'fast food', 320),
('2026-01-03', 'Groceries', 520),
('2026-01-03', 'Snacks and tea', 80),
('2026-01-04', 'Restaurant', 450),
('2026-01-05', 'Groceries', 300),
('2026-01-06', 'Snacks and tea', 50),
('2026-01-07', 'Restaurant', 600),
('2026-01-08', 'Groceries', 480),
('2026-01-09', 'fast food', 300),
('2026-01-10', 'Snacks and tea', 90),
('2026-01-11', 'Snacks and tea', 100),
('2026-01-12', 'fast food', 150);

TRUNCATE TABLE food_expenses;
select * from food_expenses;

-- q1  weekly food spending
select dayname(expense_date) as Days_name,
sum(amount)  from food_expenses
group by Days_name;

-- q2 highest spending category
select category,amount from food_expenses
order by amount desc
limit 1;

-- q3 lowest spending category
select category,amount from food_expenses
order by amount 
limit 1;

-- q4  highest spending category total 
select category,sum(amount) as total_cost
from food_expenses
group by category
order by total_cost desc
limit 1;

-- q5  lowest spending category total 
select category,sum(amount) as total_cost
from food_expenses
group by category
order by total_cost 
limit 1;

-- q6  average daily expenses
select dayname(expense_date) day_name, category, round(avg(amount)) Average
from food_expenses
group by category,day_name ;






