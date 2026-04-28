create database mobile_analysis;

use mobile_analysis;

select * 
from mobile_analysis.smartphone_analysis;

#counting total mobile for analysis
select count(brand) as total_mobile
from smartphone_analysis;

#counting total no.of each brand
select brand,count(*)as sum_brand
from smartphone_analysis
group by brand;

#Most popular brand
select brand,sum(Popularity_score) as total_popularity
from smartphone_analysis
group by brand
order by total_popularity desc
;

#Price distribution
select 
	case
     when price<15000 then 'Budget'
     when price between 15000 and 40000 then 'Midrange'
     else 'Premium'
end as price_catogery,
count(*) as Total_products
from smartphone_analysis
group by 
case
     when price<15000 then 'Budget'
     when price between 15000 and 40000 then 'Midrange'
     else 'Premium'
end
order by Total_products desc
;

# top 5 most highest rated phones
select brand,model,rating,Storage
from smartphone_analysis
where rating is not null
order by rating desc 
limit 5;

#low rated mobiles
select brand,model,rating,Storage
from smartphone_analysis
where rating is not null
order by rating asc 
limit 5;

#high priced mobile
select brand,model,price,storage
from smartphone_analysis
order by price desc
limit 5;

#brand give most offers
select brand,avg(discount) as avg_disc
from smartphone_analysis
group by brand
order by avg_disc desc;

#highest popular brand and model
select brand,model,Popularity_score
from smartphone_analysis
order by Popularity_score desc
limit 10;

#which one phone is actually worth
select brand,model,Value_for_money_score
from smartphone_analysis
order by Value_for_money_score desc
limit 10;

#brand market share using review count ,it will show most share in market
SELECT 
    Brand,
    SUM(Reviews) AS Total_Reviews,
    ROUND(
        SUM(Reviews) * 100.0 / 
        (SELECT SUM(Reviews) FROM smartphone_analysis),
        2
    ) AS Market_Share_Percentage
FROM smartphone_analysis
GROUP BY Brand
ORDER BY Market_Share_Percentage DESC;