-- Q1: Create new schema as ecommerce?
create database ecommerce;
use ecommerce;


-- Q2: Import .csv file users_data into MySQL (right click on ecommerce schema -> Table Data import Wizard -> Give path of the file 
-- -> Next -> choose options : Create a new table , select delete if exist -> next -> next)?
-- File imported Sucessfully.
select * from users_data;


-- Q3: Run SQL command to see the structure of table?
desc ecommerce.users_data;


-- Q4: Run SQL command to select first 100 rows of the database?
select * from ecommerce.users_data limit 100; 


-- Q5: How many distinct values exist in table for field country and language?
select count(distinct country),count(distinct language) from users_data;


-- Q6: Check whether male users are having maximum followers or female users?
use ecommerce;
select sum(socialNbFollowers)users,gender from users_data group by gender;


-- Q7: Calculate the total users those?
-- a)Uses Profile Picture in their Profile?
select count(hasProfilePicture) from users_data where hasProfilePicture='True';
-- b)Uses Application for Ecommerce platform?
select count(hasAnyApp) from users_data where  hasAnyApp='True';
-- c)Uses Android app?
select count(hasAndroidApp) from users_data where hasAndroidApp='True';
-- d)Uses ios app?
select count(hasIosApp) from users_data where hasIosApp='True';


-- Q8: Calculate the total number of buyers for each country and sort the result in descending order of total number of buyers? 
-- (Hint: consider only those users having at least 1 product bought.)
select count(productsBought) buyers,country from users_data where productsBought>0 group by country order by buyers desc;


-- Q9: Calculate the total number of sellers for each country and sort the result in ascending order of total number of sellers?
--  (Hint: consider only those users having at least 1 product sold.)
select count(productsSold) sellers,country from users_data where productsSold>0 group by country order by sellers desc;


-- Q10: Display name of top 10 countries having maximum products pass rate?
select max(productsPassRate)maximum,country from users_data group by country order by maximum desc limit 10;


-- Q11: Calculate the number of users on an ecommerce platform for different language choices? 
select language,count(distinct language),count(type) from users_data group by language;


-- Q12: Check the choice of female users about putting the product in a wishlist or to like socially on an ecommerce platform? 
-- (Hint: use UNION to answer this question.)
select count(productsWished),count(socialProductsLiked),gender from users_data where gender='F';
use ecommerce;

-- Q13: Check the choice of male users about being seller or buyer. (Hint: use UNION to solve this question.)?
select count(productsBought) from users_data union select count(productsSold) from users_data where gender ='M';
 


-- Q14: Which country is having maximum number of buyers?
select count(productsBought)buyers,country from users_data group by country order by buyers desc limit 1;



-- Q15: List the name of 10 countries having zero number of sellers?
select country,productsSold from users_data where productsSold=0;

select country,sum(productsSold) from users_data  group by country having sum(productsSOLD) = 0 LIMIT 10;

-- Q16: Display record of top 110 users who have used ecommerce platform recently?
select daysSinceLastLogin from users_data where daysSinceLastLogin<100 order by daysSinceLastLogin asc limit 110;


-- Q17: Calculate the number of female users those who have not logged in since last 100 days?
select count(gender) from users_data where gender='M' and daysSinceLastLogin>100;


-- Q18: Display the number of female users of each country at ecommerce platform?
select count(gender),country from users_data where gender='F' group by country;


-- Q19: Display the number of male users of each country at ecommerce platform?
select count(gender),country from users_data where gender='M' group by country;


-- Q20: Calculate the average number of products sold and bought on ecommerce platform by male users for each country?
select avg(productsSold),avg(productsBought),gender,country from users_data where gender='M' group by country;
