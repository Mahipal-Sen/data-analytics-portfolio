#  Airbnb Data Analysis using SQL (Hospitality Intelligence Hub)

##  Project Overview
This project focuses on analyzing Airbnb listing and booking data using SQL to extract insights related to pricing, 
availability, customer behavior, and neighborhood trends. The goal is to support data-driven decision-making for 
optimizing business operations and improving customer experience.

##  Tools & Technologies
- MySQL
- SQL (Structured Query Language)

##  Dataset Description
The project uses two datasets:

1. Listings Table
   - id, name, host_id, host_name  
   - neighbourhood_group, neighbourhood, room_type  

2. Booking_Details Table
   - listing_id, price, minimum_nights  
   - number_of_reviews, reviews_per_month  
   - availability_365  

Both tables are connected using **listing_id / id**.

##  Key Analysis Performed
- Data retrieval and filtering using SELECT, WHERE, LIKE, BETWEEN  
- Aggregation using COUNT, SUM, AVG, MAX, MIN  
- Grouping and sorting using GROUP BY and ORDER BY  
- Join operations to combine listings and booking data  
- Subqueries for advanced data filtering  
- Analysis of pricing, availability, and customer engagement  
- Neighborhood and room-type based analysis  

##  Key Insights
- Identified high-demand neighborhoods and room types  
- Analyzed pricing trends across different locations  
- Evaluated availability and booking patterns  
- Compared host performance based on pricing and reviews  

##  Files
- airbnb.sql (All SQL queries)

##  Conclusion
This project demonstrates strong SQL skills including joins, subqueries, aggregation,
and real-world data analysis for hospitality and business intelligence use cases.
