# Event Lifecycle and Customer Lifetime Value (CLV) Evaluation

## *Problem Statement:* A leading conference company has thousands of annual sponsors over fifty events that come to meet tens of thousands of paid attendees, speakers and guests. This project analyzes and distinguishes the characteristics of the most loyal attendees and sponsors. In addition to this, the analysis aims to predict the lifecycle of the events and the elements that contribute to smarter marketing and operational decisions.


### *Data science Hypothesis(es)/solutions considering:* Using attendee and sponsor data as well as event characteristics allows us to single out clients who return year on year and look at their distinguishing features. Merging event data to attendee data allows for a price-point analysis as well as a correlation per each event type.


### *Data sets to be used:*
> 1. Event Attendees (Orders.csv)
> 2. Event Information (Events.csv)
> 3. (Optional) CIS codes


### *Descriptive Data dictionaries for date types:*

**Orders.csv**

Column | Type | Convert to | Description
--- | --- | --- | ---
Contact_Email_Address | *object* | `str` | Email address
Created | *object* | `datetime` | Date and time of order
Account_SIC | *object* | `str` | SIC Description 
Price_List | *object* | `float` | unique price type with code : primary vs. vendor
Price_List_Type | *object* | `category` | price type: primary vs. vendor
Total_Net_Price | *object* | `float` | price paid
Account_Market | *object* | `category` | Company "market": primary vs secondary
Account_Name | *object* | `str` | Company name
Campaign_Name | *object* | `str` | camapign name
Contact_First_Name | *object* | `str` | First name
Contact_Job_Function | *object* | `str` | Job type code
Contact_Job_Title | *object* | `str` | Job title
Contact_Last_Name | *object* | `str` | Last name
Currency | *object* | `float` | Currency
Event_Plan_Code | *float64* | | Unique event identifier (used to merge datasets)
Event_Plan_Name | *object* | `str` | Event name
Event_Plan_Start_Date | *object* | `Datetime` | Event date - data specifies first day
MAC | *object* | `str` | Internal registration code
Order_Date | *object* | `datetime` | Date of order - no time
Order_Number | *object* | `str` | Unique order idetifier
Registration_Channel | *object* | `category` | Registration type 
Registration_Type | *object* | `category` | Type of attendee: e.g. Speaker
Sales_Method | *object* | `category` | Sale type: e.g. conversion
Sales_Source | *object* | `str` | Identifier for sales rep - otherwise blank


**Events.csv**

Column | Type | Convert to | Description
--- | --- | --- | ---
Topic_Area | *object* | `category` | Event subject area: e.g. eCommerce
Type | *object* | `str` | Internal event categorization - TO BE REMOVED
Code | *float64* | | Unique event identifier (used to merge datasets)
Promotion_Plan | *object* | `str` | Event name
Event_Plan_Date | *object* | `datetime` | Event date - data specifies first day
Total_Dels | *int64* | | Number of paid event attendees
Total_Rev | *int64* | | Revenue from paid attendees
Booking_Pattern_Comparison | *float64* | | Number of paid attendees on previous event edition
Total_Guests | *float64* | | Number of event guests (unpaid)
Avg_Cost_of_Acquisition | *float64* | | Cost per paid - TO BE REMOVED
Sales_and_Mktg_ROI | *object* | `int` | Sales MKTG ROI - TO BE REMOVED
Mktg_Dels | *int64* | | Number of paid atendees through MKTG channels (online, customer service)
Mktg_Cost__fcst | *float64* | | MKTG cost - TO BE REMOVED
Mktg_Cost_act | *float64* | | MKTG cost act - TO BE REMOVED
Mktg_Rev | *int64* | | Revenue from MKTG paid attendees
Mktg_perc_of_ttl_Rev | *object* | `int` | Percentage of total attendee revenue from MKTG deals
Mktg_Price_Point | *float64* | | Average price point for MKTG deals
Cost_of_Acquisition | *float64* | | Cost of acquisition - TO BE REMOVED
PP__fcst | *float64* | | PP fcst - TO BE REMOVED
PP__act | *float64* | | PP act - TO BE REMOVED
ROI__fcst | *object* | `int` | ROI fcst - TO BE REMOVED
ROI__act | *object* | `int` | ROI act - TO BE REMOVED
Sales_Dels | *int64* | | Number of paid attendees from the deleagte sales team
Sales_Rev | *int64* | | Revenue from paid attendees from sales team
Sales_perc_of_ttl_rev | *object* | `int` | Percentage of total attendee revenue from sales deals
Sales_Price_Point | *int64* | | Average price point for sales deals
Num_Active_Inq | *int64* | | Number of active (inbound) inquiries
Active_Inq_Del | *int64* | | Number of paid attendees converted from active inquiries
Active_Conversion_Rate | *object* | `int` | Active conversion rate
Num_Passive_PDF | *int64* | | Number of agenda downloads
Passive_PDF_Del | *int64* | | Number of paid attendees converted from agenda downloads
Passive_Conversion_Rate | *object* | `int` | Passive inquiry conversion rate
Total_EQ_Rev | *int64* | | Total revenue from active and passive inquiries 
EQ_Price_Point | *float64* | | Average price point for EQ deals
EQ_perc_of_ttl_Rev | *object* | `int` | Percentage of total attendee revenue from Inquiry deals
Spex_Rev | *int64* | | Total sponsorship revenue for event
Spex_Last_Year | *float64* | | Sponsorship revenue from previous year
Num_Spex_EQs | *int64* | | Number of sponsorship inquiries for event
Num_Spex_Props | *float64* | | Number of sponsorship proposals for event
Props_Last_Year | *float64* | | Number of sponsorship proposals last year
Num_TMs | *float64* | | Num TM - TO BE REMOVED
Num_SPKRs | *int64* | | Number of speakers at the event


### *Potential buiness cases for the project:* Understanding the types of attendees that are more likely to attend an event allows marketing and sales teams to better focus their efforts on prospects whose decision they are more likely to influence. For example, identifying characteristics of a event sponsor with a high potential for a long partership with the company, could trigger a longer nurturing camapign and result in hundreds of thousands of dollars in revenue from this single client. Similarly, identifying a client who is unlikely to return for many events in this capacity could save the company time and effort. Moreover, understanding the lifecycle and the elements that contibute to the rise or decline of events can greatly help in the decision to further invest or divert investment from such products. 


### *Potential stakeholders:* This analysis is critical for all operational decision makers of the company - from the CEO to marketing and sales leaders - a better understanding of the events and attendees can contribute to smarter choices in terms of investments of time and money. Specifically, this project is to be shared with the company CEO, Managing Director of the local office, Head of Marketing of the Americas and Heads of Sales of both Sponsors and Delegates.


### *Potential places to share results of this project:* This project is intended as an internal analysis for this specific company and is mostly to be used for such purposes. A similar analysis can however be used for similar companies with multiple products who could be interested in better understanding their clients lifecycles and identifying prospects with a higher potential for high lifetime revenue.





### Leading Questions/Thoughs:

Are these types of companies (SIC) that pay more or less to attend conferences?

Geography? Proximity to event?

Does price point correlate to event size?

Price point correlation to event category/type?

Booking pattern / booking pattern by event type

Most popular day for booking?

Group prices vs. avg prices for event – threshold group size? Revenue?
Price point analysis.

Return analysis – Are you more likely to come again if you purchase via consultative phone conversation? Is someone from your company?

Break down this analysis for Sponsors! Majority of revenue.




*Proposal requirements:*

> 1. Project Name: Title for your project 
> 2. Problem Statement: What are you trying to solve?
> 2. Data science Hypothesis(es)/solutions considering: One or multiple angles to consider solving this problem with data science  
> 3. Data sets to be used: Share the links and files, .csvs, .js, .xlsx, .txt, website URLs
> 4. Data dictionaries to describe the data types you're using: write these out in markdown as tables  
> 5. Potential business cases relative to project: how would this help businesses out to make money or save money or improve accuracy or make better products
> 6. Potential stakeholders who would find this interesting: who would be your ideal customer or client for this?
> 7. Potential places to share your results post project (client, world, website, blog)

*Deliverable: Monday, May 14*
> 1. To be pushed to github
> 2. To be submitted as a markdown readme.md file in your project-final repository


•	Avg. price point of returning sponsors vs. new sponsors to the event.
•	Are sponsors more likely to come back after large event?
•	% of returning vs new based on event size and industry.
•	Is there a correlation between more attendees and more sponsors?

Average price  - growth or decline and avg price point? Correlation?

Event size – is there a (and what is) plateau for event size and revenue. 

