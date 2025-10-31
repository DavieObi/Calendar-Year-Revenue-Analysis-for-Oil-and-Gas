# Calendar Year Revenue Analysis for Oil and Gas

## Project Overview
This project presents a comprehensive calendar year revenue analysis for the oil and gas sector, leveraging SQL for data processing and in-depth analytical insights. The analysis focuses on understanding historical revenue trends, identifying key performance drivers across various dimensions (states, products, revenue types, commodities, land classes, and counties), and forecasting future revenue. The aim is to transform raw financial data into actionable intelligence, supporting strategic decision-making and optimizing business operations within the industry.

## Problem Statement
The oil and gas industry often grapples with fluctuating market dynamics, complex revenue streams, and the need for data-driven insights to maintain profitability and ensure sustainable growth. Without a clear understanding of historical performance, key revenue contributors, and future projections, stakeholders face challenges in optimizing resource allocation, identifying diversification opportunities, and making informed strategic decisions, leading to potential revenue loss or missed growth opportunities.

## Project Objective
The primary objectives of this project are to:

* **Enhance Data Clarity and Reliability:** Implement robust data preprocessing techniques (e.g., handling NULL values, removing irrelevant columns) to ensure clean, accurate, and interpretable revenue datasets.

* **Identify Key Revenue Drivers:** Analyze revenue contributions across diverse dimensions such as states, products, revenue types, commodities, land classes, and counties to pinpoint major financial contributors and areas for strategic focus.

* **Uncover Historical Trends and Patterns:** Calculate total and average annual revenues, analyze year-over-year growth rates, and assess revenue distribution to understand past performance and identify significant trends.

* **Provide Future Revenue Projections:** Develop forecasting models (e.g., 3-year moving average, linear trend analysis) to predict future revenue, thereby aiding in proactive strategic planning, cost optimization, and risk mitigation.

* **Support Informed Decision-Making:** Deliver actionable insights that empower stakeholders to optimize resource allocation, identify growth and diversification opportunities, and make data-driven decisions to enhance overall financial performance in the oil and gas sector.

## Analysis
First, we observed that certain columns in our dataset had NULL values, which were expected based on the nature of the data (e.g., onshore revenue fields being empty for offshore records and vice versa). To make the dataset cleaner and more interpretable, we replaced all these NULL values with "N/A" using the COALESCE function. This ensured that the data remains clear without any ambiguous blanks.
We applied this update to several columns, including:

 - Calendar Year

 - Land Class

 - Land Category

 - State

 - County

 - Offshore Region

 - Revenue Type

 - Mineral Lease Type

 - Commodity

 - Product

This preprocessing step improves readability and clarity for analysis, as it provides consistent placeholders in the dataset.


Next we removed the FIPS_Code column from the calendar_year_rev table using the DROP COLUMN command. This step simplifies our dataset by eliminating a field that is not relevant to the analysis, helping us focus on the most useful data.


We then calculated the Total Revenue from the calendar_year_rev table using the SUM function. By applying the ROUND function, we ensured the result is neatly formatted to two decimal places. This gives us a precise and presentable summary of the overall revenue generated. 

The Total Revenue calculated from the calendar_year_rev table comes out to 249,993,233,733.29. This provides us with a clear overview of the immense scale of revenue across all calendar years.


We calculated the Average Annual Revenue by first grouping the data by Calendar_Year to determine the Annual Revenue for each year. Then, we computed the average of these annual values using the AVG function and rounded the result to two decimal places for clarity.

The resulting Average Annual Revenue is 11,904,439,701.59. This provides a significant insight into the overall revenue trend across the years.


For our next analysis, analyzing total revenue by different features, we're diving deeper to uncover how various factors contribute to the overall revenue. The goal here is to provide stakeholders with a granular view of the revenue breakdown, enabling them to better understand which areas, categories, or attributes are driving revenue. This, in turn, can inform strategic decisions, identify key opportunities, and highlight any underperforming segments.

For example:

Analyzing total revenue by land class (onshore vs. offshore) can reveal how much revenue comes from different land types.

Looking at revenue by state might show which regions are contributing the most, allowing for resource allocation and investment decisions.

Exploring revenue by commodity or product can identify the most profitable items and potential areas for diversification.

This kind of breakdown helps stakeholders connect the data to the broader business strategy. It’s all about painting a clearer picture of where the revenue is coming from and why it matters.


## Revenue Contribution by State: Analysis Summary

Here, we examined the contribution of revenue by state to identify the key geographic drivers of total revenue.

**Objective**: To evaluate the total revenue generated by each state and calculate their percentage contribution to the overall revenue. This analysis aims to highlight top-performing states and provide a comparative view of their financial impact.

**Methodology**: 
 - **Total Revenue Calculation**: Using SQL, we summed up the revenue for each state from the dataset.

 - **Percentage Contribution**: For each state, we calculated the proportion of its revenue relative to the total revenue across all states. The percentage values were rounded to two decimal places for accuracy.

 - **Sorting**: States were ranked in descending order of total revenue to easily identify top contributors.

**Expected Insights**:

 - A clear ranking of states based on their total revenue contributions.

 - Identification of states with significant revenue percentages, which can guide decision-making in resource allocation and strategy formulation.

 - A foundation for understanding regional patterns and opportunities.

This analysis provides stakeholders with a strategic view of state-level contributions to revenue, facilitating more informed geographic or policy decisions. Once the results are available, we can further interpret and present actionable insights.


**Top 20**
| State          | Total Revenue      | Revenue Percentage |
|----------------|--------------------|---------------------|
| N/A            | 158018986575.18   | 63.21              |
| New Mexico     | 35175637979.2     | 14.07              |
| Wyoming        | 34667303719.14    | 13.87              |
| Colorado       | 5712043519.93     | 2.28               |
| Utah           | 4735421749.09     | 1.89               |
| North Dakota   | 4175200562.05     | 1.67               |
| California     | 2422162439.95     | 0.97               |
| Montana        | 1505688789.18     | 0.6                |
| Alaska         | 917168821.82      | 0.37               |
| Texas          | 536596192.43      | 0.21               |
| Louisiana      | 472746690.9       | 0.19               |
| Nevada         | 323519294.43      | 0.13               |
| Oklahoma       | 316567090.65      | 0.13               |
| Missouri       | 197269792.03      | 0.08               |
| Arkansas       | 193370792.66      | 0.08               |
| Idaho          | 170641195.91      | 0.07               |
| Kansas         | 107421051.55      | 0.04               |
| Alabama        | 80101063.5        | 0.03               |
| Mississippi    | 76270014.14       | 0.03               |
| South Dakota   | 35071752.23       | 0.01               |


### Key Insights
1. **Revenue Concentration**:
A significant portion of the total revenue 63.21% comes from records categorized as N/A. This suggests a large contribution from data that are not associated with a specific state. This represents offshore revenues, which warrants further investigation to understand its importance.

The top three contributing states (New Mexico, Wyoming, and Colorado) collectively account for 30.22% of the revenue, showcasing the dominance of these regions in oil and gas revenue generation.

2. **Top Performing States**:
New Mexico leads with 14.07%, followed closely by Wyoming with 13.87%, and Colorado at 2.28%. These states are critical drivers of total revenue and likely hold strategic importance for the industry.

3. **Low Revenue Contributors**:
Several states, such as Georgia, Tennessee, and Wisconsin, show negligible contributions (0.00%), indicating minimal or no activity in these regions concerning oil and gas production. This highlights regions with potential for further exploration or investment, if feasible.

4. **Regional Patterns**:
States with significant oil and gas production, such as Texas and Louisiana, surprisingly contribute smaller percentages (0.21% and 0.19%, respectively). This could be due to missing data, outdated records, or differences in classification methods.

5. **Strategic Opportunities**:
Understanding why certain states like New Mexico and Wyoming perform exceptionally well could provide insights into replicating their success in other regions.

For states with negligible revenue, it may be worth exploring whether geological limitations or untapped potential are the reasons behind their low contributions.

These insights set the stage for deeper exploration of regional dynamics and the factors influencing revenue generation across states.


## Revenue contribution by product

Analyzing revenue contribution by product is a crucial step that provides insight into the financial impact of various oil and gas products. Here's what we accomplished:

**Summing Revenue by Product**:

 - It calculates the total revenue for each product using the SUM function.

**Calculating Percentage Contribution**:

 - For each product, it determines the proportion of its revenue relative to the total revenue across all products. This percentage is rounded to two decimal places for clarity.

**Ranking Products**:

 - Products are ranked in descending order based on their total revenue contribution, allowing us to easily identify the most and least profitable products.

### Purpose of This Analysis:
This step is designed to pinpoint which products generate the highest revenue and assess their relative contributions. It can help stakeholders:

Identify the most lucrative products for prioritization and investment.

Highlight underperforming products that may need further exploration, marketing, or adjustment.

Establish a basis for strategic decisions around product development and diversification.


**Top 20**
| Product                        | Total Revenue       | Revenue Percentage |
|--------------------------------|---------------------|---------------------|
| Oil                            | 107105027347.40     | 42.84              |
| N/A                            | 45312023813.90      | 18.13              |
| Processed (Residue) Gas        | 30437821945.32      | 12.18              |
| Unprocessed Gas                | 13772704673.83      | 5.51               |
| Coal                           | 13372664601.40      | 5.35               |
| Gas Plant Products             | 9227936083.03       | 3.69               |
| Condensate                     | 8815085199.43       | 3.53               |
| Sweet Crude                    | 6836386461.61       | 2.73               |
| Unprocessed (Wet) Gas          | 5303754546.56       | 2.12               |
| Coal Bed Methane               | 4782499602.05       | 1.91               |
| Carbon Dioxide Gas (CO2)       | 938662086.51        | 0.38               |
| Soda Ash                       | 544676996.59        | 0.22               |
| Yellow Wax Crude               | 482859373.98        | 0.19               |
| Pipeline Fuel/Loss             | 452139159.47        | 0.18               |
| Condensate (bbl)               | 425982075.51        | 0.17               |
| Black Wax Crude                | 293394600.00        | 0.12               |
| Drip or Scrubber Condensate    | 205007848.92        | 0.08               |
| Geothermal - Electrical Gen (lbs) | 166192919.46    | 0.07               |
| Phosphate Raw Ore              | 160581936.82        | 0.06               |
| Lead Concentrate               | 143896131.42        | 0.06               |


### Insights
**Dominance of Oil**:

 - Oil contributes the highest revenue, accounting for 42.84% of the total. This underscores its critical importance as the primary driver of revenue.

**Large Contribution of N/A**:

 - Entries categorized as N/A make up 18.13% of revenue. This falls majorly under oil(pre-production) while others under Hardrock, Potassium, Geothermal, Coal, Phosphate, Wind and Not tied to a commodity.

**Other Significant Contributors**:

 - Processed (Residue) Gas (12.18%) and Unprocessed Gas (5.51%) are substantial contributors, alongside Coal (5.35%). These show the significance of diversified energy sources.

**Prominent Secondary Products**:

 - Products such as Gas Plant Products (3.69%) and Condensate (3.53%) reflect the importance of refining byproducts.

**Focus Areas**:

 - Lesser contributors like Carbon Dioxide Gas (0.38%) and Soda Ash (0.22%) might represent niche markets or specialized applications. They could be worth exploring for strategic opportunities.

This analysis offers a strong view of product-level revenue distribution, helping stakeholders identify high-impact products and areas for diversification or further focus.


## Onshore vs. Offshore Revenue Analysis
**Objective**: To evaluate the revenue distribution between onshore and offshore operations. This analysis aims to determine the financial contributions of each land category, providing insights into the relative importance of onshore and offshore activities.

**Methodology**:
 - **Data Aggregation**: We calculated the total revenue for each land category (Land_Category) using the SUM function.

**Percentage Contribution**: 
 - We determined the proportional revenue contribution of each category to the total revenue. This was calculated as a percentage and rounded to two decimal places for accuracy.

**Sorting**: Land categories were ranked in descending order of total revenue to highlight the most significant contributors.

**Purpose**:
This analysis provides a clear comparison of the revenue generated from onshore and offshore activities. Insights gained can support stakeholders in:

 - Assessing the economic significance of onshore vs. offshore operations.

 - Identifying opportunities for resource optimization or investment.

 - Understanding industry dynamics to guide strategic decisions.


| Land Category       | Total Revenue       | Revenue Percentage |
|---------------------|---------------------|---------------------|
| Offshore            | 141417325261.20    | 56.57              |
| Onshore             | 108449942938.60    | 43.38              |
| Not Tied to a Lease | 125965533.49       | 0.05               |


### Insights:
**Offshore Dominance**:

 - Offshore operations contribute the largest share of revenue at 56.57%, making them the most significant source of revenue generation. This suggests that offshore activities are highly productive or involve more lucrative resources.

**Substantial Onshore Contribution**:

 - Onshore operations account for 43.38% of the total revenue. While slightly lower than offshore, onshore still represents a significant portion, reflecting its critical role in the industry.

**Minimal Impact of 'Not Tied to a Lease'**:

 - The category "Not Tied to a Lease" contributes a negligible 0.05% of the total revenue. This indicates that such cases are rare or generate very low financial returns relative to onshore and offshore operations.

**Strategic Implications**:

 - The higher revenue from offshore operations could highlight their importance for investment and resource allocation.

 - Onshore operations, with their near-equivalent share, remain crucial and could benefit from optimization to close the gap with offshore.

 - Investigating the "Not Tied to a Lease" category may help clarify if it includes specific exceptions, anomalies, or overlooked opportunities.

This analysis provides a clear overview of how revenue is distributed between land categories, helping stakeholders prioritize efforts in offshore and onshore activities.


## Total Revenue Per Year: Analysis Plan
**Objective**: To calculate the total revenue generated for each calendar year and identify trends or patterns in revenue distribution over time. This analysis provides a chronological perspective on financial performance.

**Methodology**:
 - **Grouping Data**: We grouped the data by Calendar_Year to aggregate revenue for each year.

 - **Total Revenue Calculation**: Using the SUM function, the revenue for each year was calculated.

 - **Formatting for Clarity**: The results were rounded to two decimal places for readability.

 - **Ranking**: Years were sorted in descending order by total revenue to highlight the most financially impactful periods.

**Purpose**:
This analysis allows stakeholders to:

 - Identify years with peak revenue performance.

 - Understand trends in revenue growth or decline over time.

 - Pinpoint specific years that may require deeper investigation due to outstanding or underwhelming results.


| Calendar Year | Total Revenue       |
|---------------|---------------------|
| 2022          | 23909575936.92     |
| 2008          | 23485404988.10     |
| 2023          | 17289688735.16     |
| 2014          | 13486237497.71     |
| 2012          | 13482574507.47     |
| 2013          | 13405177613.12     |
| 2006          | 13012380921.01     |
| 2007          | 11831299841.17     |
| 2011          | 11674260303.09     |
| 2021          | 11345943831.76     |
| 2018          | 11093338080.88     |
| 2010          | 10833934334.55     |
| 2019          | 10642840813.41     |
| 2005          | 10552746925.54     |
| 2003          | 8694582697.08      |
| 2004          | 8619528987.52      |
| 2009          | 8235754310.17      |
| 2015          | 8186319672.93      |
| 2017          | 7657203562.62      |
| 2020          | 6673483858.27      |
| 2016          | 5880956314.81      |


### Insights:
**Top Revenue Years**:

 - 2022 leads with the highest total revenue of 23.91 billion, closely followed by 2008 at 23.48 billion. These years may represent peak periods of activity or profitability in the oil and gas industry.

**Strong Recent Performance**:

 - 2023 ranks third, showing continued high revenue generation. This highlights sustained industry performance into recent years.

**Middle Range Revenue Years**:

 - Years like 2014, 2012, and 2013 cluster around the 13 billion range, suggesting steady growth or consistent revenue generation during that period.

**Notable Historical Trends**:

 - Years like 2006, 2007, and 2011 also show impressive revenue contributions, reflecting strong historical performance that may correlate with industry trends or external factors such as market demand.

**Declining Revenue in Some Periods**:

 - The data shows lower revenue in years such as 2020 (6.67 billion) and 2016 (5.88 billion), potentially due to global events like economic recessions or disruptions in oil and gas markets.

**Strategic Implications**:

 - Stakeholders should investigate what drove the exceptional performance in top years like 2022 and 2008, and explore whether similar conditions can be replicated.

 - Understanding the declines in years such as 2020 may also help identify challenges to address in future strategic planning.

This analysis provides a clear picture of revenue trends over time, helping stakeholders understand peak periods and areas for improvement.


## Revenue by Revenue Type: Analysis Plan
**Objective**: To analyze the revenue contributions of different Revenue Types, identifying which categories drive the most revenue and how they compare to each other.

**Methodology**:
 - **Data Aggregation**: The data is grouped by Revenue_Type to calculate the total revenue for each type.

 - **Summing Revenue**: Using the SUM function, total revenue is calculated for every Revenue_Type.

 - **Formatting**: Results are rounded to two decimal places for improved clarity.

 - **Ranking Revenue Types**: The results are sorted in descending order to highlight the most significant contributors.

### Purpose:
This analysis will help stakeholders:

 - Identify the most significant revenue types, offering insights into their financial impact.

 - Highlight underperforming revenue types that could be addressed or further developed.

 - Assess the diversity of revenue streams and explore opportunities for optimization or growth.



| Revenue Type      | Total Revenue by Revenue Type |
|-------------------|-------------------------------|
| Royalties         | 204433853028.79              |
| Bonus             | 37580704921.31              |
| Rents             | 4794407670.87               |
| Other revenues    | 2481649571.70               |
| Inspection fees   | 581283806                   |
| Civil penalties   | 121334734.63                |



### Insights:
**Royalties Lead the Way**:

 - Royalties dominate the revenue categories, contributing a substantial 204.43 billion. This suggests that royalties are a critical driver of revenue, likely stemming from ongoing oil and gas production agreements or leases.

**Bonus Contributions**:

 - Bonus payments contribute 37.58 billion, ranking second. These may reflect initial payments made by companies to secure leases or rights, highlighting their strategic importance in revenue generation.

**Smaller but Significant Contributions**:

 - Rents (4.79 billion) and Other revenues (2.48 billion) provide smaller contributions but still play essential roles. Rents likely derive from ongoing lease agreements, while other revenues might encompass miscellaneous payments or fees.

**Fees and Penalties**:

 - Inspection fees (581 million) and Civil penalties (121 million) make up the smallest portions of revenue. While their financial impact is minimal, they represent vital regulatory or compliance-related income.

### Strategic Implications:

The overwhelming dominance of royalties highlights the importance of maintaining strong production agreements and monitoring lease compliance to sustain this revenue stream.

Stakeholders might consider whether additional efforts to optimize revenue from smaller categories like rents or inspection fees could lead to incremental financial benefits.

This analysis provides a clear picture of the revenue structure by type, giving stakeholders insights into areas of strength and opportunities for further growth or optimization.


## Total Revenue by Commodity: Analysis Plan
**Objective**: To evaluate the revenue contributions of different commodities, highlighting the financial impact of each and identifying key drivers in the dataset.

**Methodology**:
 - **Grouping Data**: We grouped the data by Commodity to aggregate revenue for each commodity.

 - **Calculating Total Revenue**: Using the SUM function, the total revenue was calculated for each commodity.

 - **Ranking Commodities**: Commodities were sorted in descending order of total revenue contribution to emphasize the most impactful ones.

 - **Formatting for Clarity**: Results were rounded to two decimal places for improved readability.

**Purpose**:
This analysis enables stakeholders to:

 - Identify the most profitable commodities, helping prioritize production and investment efforts.

 - Highlight lower-contributing commodities for potential optimization or further exploration.

 - Understand the revenue structure and assess opportunities for diversification.


| Commodity                | Total Revenue by Commodity |
|--------------------------|----------------------------|
| Oil                      | 124446621720.90           |
| Gas                      | 54875004291.70            |
| Oil & gas (pre-production) | 33488377391.77          |
| Coal                     | 18481354089.61           |
| Natural gas liquids      | 9227936083.03            |
| Wind                     | 5745810048.61            |
| Carbon dioxide           | 938662086.51             |
| Not tied to a commodity  | 707249089.52             |
| Soda ash                 | 520359801.97             |
| Geothermal               | 414723066.07             |
| Potassium                | 311126128.03             |
| Sodium                   | 182101693.48             |
| Phosphate                | 168176827.42             |
| Copper                   | 159474634.02             |
| Lead                     | 141665430.07             |
| Sand & gravel            | 56408843.50              |
| Gilsonite                | 32402336.18              |
| Zinc                     | 29369229.59              |
| Sulfur                   | 26336111.33              |
| Helium                   | 15808298.56              |



### Insights:
**Oil as the Revenue Leader**:

 - Oil is by far the largest revenue generator at 124.45 billion, highlighting its critical role as the most valuable commodity.

**Gas and Pre-Production Oil & Gas**:

 - Gas contributes a significant 54.88 billion, followed by Oil & Gas (pre-production) at 33.49 billion, demonstrating their importance in sustaining revenue streams.

**Coal's Strong Impact**:

 - With 18.48 billion, Coal represents a noteworthy portion of total revenue, showcasing its enduring relevance as a commodity.

**Natural Gas Liquids and Renewable Energy**:

 - Natural gas liquids (9.23 billion) and Wind (5.75 billion) reflect the growing diversity in energy sources, with renewables making a notable contribution.

**Smaller Commodities with Niche Roles**:

 - Commodities like Carbon dioxide (938.66 million), Soda ash (520.36 million), and Geothermal (414.72 million) provide smaller but specialized revenue streams.

**Opportunities for Growth**:

 - Lower-revenue commodities such as Zinc, Sulfur, and Helium could represent niche markets or areas for potential exploration and development.

This analysis highlights the dominance of traditional energy sources like oil and gas, while also pointing to the diversification of revenue through renewables and specialized commodities.


## Total Revenue by Land Class: Analysis Plan
**Objective**: To evaluate the revenue distribution across different land classes, identifying their financial contributions and relative importance within the dataset.

**Methodology**:
 - **Data Aggregation**: The data is grouped by Land_Class to calculate the total revenue associated with each land class.

 - **Revenue Summation**: Using the SUM function, the total revenue is computed for each category.

 - **Sorting**: Land classes are ranked in descending order by total revenue contributions, emphasizing the most financially impactful ones.

 - **Formatting**: Values are rounded to two decimal places for clarity.

**Purpose**:
This analysis helps stakeholders:

 - Determine the most profitable land classes, enabling better resource allocation and operational focus.

 - Identify underperforming land classes to explore optimization opportunities or alternative uses.

 - Understand revenue patterns across diverse land categories to guide strategic decisions.


| Land Class       | Total Revenue by Land Class |
|------------------|-----------------------------|
| Federal          | 233517511181.55            |
| Native American  | 16475722551.73             |


### Insights:
**Federal Land Dominates Revenue**:

 - Revenue from Federal lands is significantly higher at 233.52 billion, accounting for the vast majority of total revenue. This highlights the critical role of federal lands in driving financial performance, likely due to extensive oil and gas activities on federally managed properties.

**Contribution from Native American Lands**:

 - Native American lands contribute 16.48 billion, reflecting a notable but smaller share of total revenue. This emphasizes the importance of these lands in supporting revenue streams while also highlighting their specific, unique management and leasing processes.

**Strategic Implications**:

 - The overwhelming revenue from Federal lands suggests that stakeholders should prioritize compliance, sustainability, and resource management to maintain and enhance revenue generation from these areas.

 - Native American lands, while contributing a smaller share, could represent opportunities for further investment or development in a way that respects cultural and legal considerations.

This concise analysis offers a clear understanding of how land class impacts revenue, providing a foundation for strategic decision-making.



## Top 10 Counties by Total Revenue: Analysis Plan
**Objective**: To identify the top 10 counties with the highest total revenue, offering insights into the regional distribution of financial contributions.

**Methodology**:
 - **Grouping Data**: Revenue is grouped by County to aggregate the total earnings for each.

 - **Summing Revenue**: Using the SUM function, total revenue is calculated for every county.

 - **Ranking and Selection**: Counties are sorted in descending order of total revenue, and the top 10 counties are selected.

 - **Formatting**: Revenue figures are rounded to two decimal places to enhance clarity.

**Purpose**:
This analysis enables stakeholders to:

 - Pinpoint high-performing counties that generate substantial revenue.

 - Understand regional dynamics, such as clusters of financial activity.

 - Assess opportunities for growth or investment in top-performing areas.



| County      | Total Revenue       |
|-------------|---------------------|
| N/A         | 158018986575.18    |
| Campbell    | 15174900392.36     |
| Eddy        | 13815409962.36     |
| Lea         | 13208785645.62     |
| Sublette    | 8282276727.22      |
| San Juan    | 4741480593.29      |
| Rio Arriba  | 3031371738.49      |
| Converse    | 2677798879.56      |
| Sweetwater  | 2580285304.32      |
| Uintah      | 2448590968.63      |



### Insights:
**Significant Revenue Contribution from 'N/A'**:

 - The N/A category contributes the largest portion of revenue at 158.02 billion, indicating a significant amount of revenue not tied to a specific county. This represent offshore revenue that needs further exploration.

**Top-Performing Counties**:

 - Campbell County leads with 15.17 billion, closely followed by Eddy County (13.82 billion) and Lea County (13.21 billion). These counties are evidently vital hubs for revenue generation, possibly driven by extensive resource extraction activities.

**Middle Revenue Contributors**:

 - Sublette County ranks fourth with 8.28 billion, followed by San Juan County (4.74 billion) and Rio Arriba County (3.03 billion), showcasing their importance in supporting overall revenue.

**Smaller but Notable Contributions**:

 - Counties like Converse, Sweetwater, and Uintah contribute between 2.44 billion and 2.67 billion, still representing meaningful financial impact, though on a smaller scale compared to the top performers.

**Strategic Considerations**:

 - Understanding why certain counties like Campbell and Eddy dominate revenue generation can offer insights into resource availability, operational efficiency, or policy impacts.

 - Investigating the N/A classification may help identify potential data gaps or opportunities for better categorization.

This analysis highlights the key revenue-generating counties, providing a focused view of regional contributions.


## Year-over-Year Growth Rate: Analysis Plan

**Objective**: To calculate the Year-over-Year (YoY) growth rate in revenue, providing insights into annual financial performance trends.

**Methodology**:

 - **Data Alignment**: Revenue for each year is paired with the prior year's data using a self-join on the calendar_year_rev table.

 - **Summing Revenue**: Total revenue is aggregated for each year using the SUM function.

 - **Growth Rate Calculation**: The YoY growth percentage is computed as:

YoY Growth (%) = [(Current Year Revenue − Previous Year Revenue)/Previous Year Revenue] * 100

 - **Error Handling**: Division by zero is avoided with the NULLIF function when the previous year's revenue is zero.

 - **Sorting and Grouping**: Results are grouped by year and presented in chronological order.

**Purpose**: This analysis enables stakeholders to:

 - Track yearly revenue trends and identify growth patterns.

 - Highlight periods of significant revenue increase or decrease.

 - Inform strategic decisions based on revenue performance insights.


| Calendar Year | Total Revenue       | YoY Growth Percentage |
|---------------|---------------------|------------------------|
| 2003          | 8694582697.08      | NULL                   |
| 2004          | 18816431779755.6   | -1.76                 |
| 2005          | 23247701477036.8   | 24.58                 |
| 2006          | 28171804694000.2   | 14.38                 |
| 2007          | 27614253829242.2   | -11.54                |
| 2008          | 56341486566316.3   | 97.84                 |
| 2009          | 19823460624588.1   | -64.1                 |
| 2010          | 25470579620571.5   | 31.44                 |
| 2011          | 27469534493106.9   | 7.3                   |
| 2012          | 31859323561149.1   | 17.33                 |
| 2013          | 31180443128246.4   | -0.45                |
| 2014          | 31328529707175.5   | -2.83                |
| 2015          | 19688098813425.7   | -38.64               |
| 2016          | 13990795072918.9   | -26.65               |
| 2017          | 17841284300891.3   | 32.02                 |
| 2018          | 25492490909842     | 41.79                 |
| 2019          | 24989390229843.2   | -4.26                |
| 2020          | 15702707518495.6   | -36.27               |
| 2021          | 26265859970599     | 78.98                 |
| 2022          | 52577157485457.4   | 113.25                |
| 2023          | 37570493621417.6   | -28.77               |


### Insights:
**Exceptional Growth in 2022**:

 - 2022 stands out with the highest Year-on-Year (YoY) growth rate of 113.25% and a total revenue of 52.58 billion, representing a period of remarkable financial success. This growth warrants further exploration to identify driving factors like market conditions, operational advancements, or policy changes.

**Unstable Growth Patterns**:

 - Several years experienced significant declines, such as 2009 (-64.1%), 2015 (-38.64%), 2020 (-36.27%), and 2023 (-28.77%). These drops could correlate with global events, market recessions, or reduced operational output, and further investigation might uncover strategies to mitigate future risks.

**Years of Consistent Growth**:

 - Years like 2005 (24.58%), 2006 (14.38%), and 2018 (41.79%) reflect strong growth, suggesting periods of stability and successful initiatives that could serve as benchmarks for future strategies.

**Revenue Peaks**:

 - Revenue peaked in 2008 with 56.34 billion, showcasing extraordinary financial results and the highest single-year performance. Similar patterns appear in 2022, reinforcing their importance as standout years.

### Strategic Implications:

 - Investigating years with sharp declines (e.g., 2009 and 2020) could highlight vulnerabilities in external factors or operational efficiency.

 - Analyzing drivers behind the growth in years like 2008, 2018, and 2022 might offer replicable strategies for sustained revenue performance.

This analysis highlights both growth opportunities and challenges across the years, providing a comprehensive view of revenue dynamics.


## Pareto Analysis (80/20 Rule): Identifying Key Revenue Contributors

**Objective**:
 - The Pareto Principle, also known as the 80/20 Rule, asserts that a majority (80%) of outcomes are often driven by a minority (20%) of inputs. Applied to revenue analysis, this principle helps identify the top contributors—whether commodities, states, or other factors—driving the bulk of the revenue. This analysis aims to uncover and emphasize those key contributors that have the most significant impact on overall financial performance.


## Pareto Analysis for Commodities

**Objective**: To implement the Pareto Principle for commodities, analyzing their revenue contribution and categorizing them into two groups:

 - Top 20%: Commodities responsible for 80% of the revenue.

 - Remaining 80%: Commodities that account for the other 20%.

**Methodology**:
**Revenue Aggregation**:

 - Using a Common Table Expression (CTE), revenue data is grouped by Commodity to calculate the total revenue for each.

**Ranking and Percentage Calculation**:

 - Commodities are ranked in descending order of total revenue.

 - The revenue contribution percentage of each commodity is computed relative to the overall revenue.

 - Cumulative percentages are calculated to track the point at which 80% of the total revenue is accumulated.

**Categorization**:

 - Each commodity is classified into Top 20% or Remaining 80%, based on whether its cumulative percentage falls within or beyond the 80% threshold.


### Purpose:
This analysis seeks to:

 - Highlight the key revenue drivers among commodities.

 - Provide clarity on revenue distribution to support focused investment and operational strategies.

 - Offer insights into how well the dataset aligns with the 80/20 rule, aiding in understanding financial concentration.

### Top 10
| Commodity                   | Total Revenue      | Revenue Percentage | Cumulative Percentage | Pareto Category |
|-----------------------------|--------------------|---------------------|-----------------------|-----------------|
| Oil                         | 124446621720.90   | 49.78              | 49.78                | Top 20%         |
| Gas                         | 54875004291.70    | 21.95              | 71.73                | Top 20%         |
| Oil & gas (pre-production)  | 33488377391.77    | 13.40              | 85.13                | Remaining 80%   |
| Coal                        | 18481354089.61    | 7.39               | 92.52                | Remaining 80%   |
| Natural gas liquids         | 9227936083.03     | 3.69               | 96.21                | Remaining 80%   |
| Wind                        | 5745810048.61     | 2.30               | 98.51                | Remaining 80%   |
| Carbon dioxide              | 938662086.51      | 0.38               | 98.88                | Remaining 80%   |
| Not tied to a commodity     | 707249089.52      | 0.28               | 99.17                | Remaining 80%   |
| Soda ash                    | 520359801.97      | 0.21               | 99.38                | Remaining 80%   |
| Geothermal                  | 414723066.07      | 0.17               | 99.54                | Remaining 80%   |


### Insights:
**Key Revenue Drivers (Top 20%)**:

 - The Top 20% of commodities include Oil and Gas, which together contribute 71.73% of the total revenue. Oil alone accounts for 49.78%, underscoring its dominance as the most significant revenue-generating commodity.

**Remaining 80% Contributions**:

 - Commodities in the Remaining 80% category contribute the other 28.27% of revenue. This includes pre-production Oil & Gas (13.40%), Coal (7.39%), and other smaller contributors such as Natural Gas Liquids and Wind.

**Revenue Concentration**:

 - The application of the Pareto Principle shows a strong alignment, with the majority of revenue being driven by a minority of commodities. This highlights the industry’s reliance on a few key resources.

**Strategic Focus**:

 - Efforts should prioritize maximizing production and efficiency for Oil and Gas, as they represent the most impactful commodities.

 - For commodities in the Remaining 80%, there may be opportunities for diversification, optimization, or exploring niche markets (e.g., Wind or Carbon Dioxide).

**Opportunities for Growth**:

 - While Oil and Gas dominate, commodities like Coal, Natural Gas Liquids, and Wind show significant contributions that could be further developed or expanded to reduce dependency on the Top 20%.

This Pareto Analysis provides clear guidance on which commodities to focus on for sustaining revenue growth while exploring new opportunities for diversification.


## Pareto Analysis for States

**Objective**: To apply the Pareto Principle to states by analyzing their revenue contributions. This analysis divides states into:

 - Top 20%: States generating 80% of the revenue.

 - Remaining 80%: States accounting for the remaining 20%.

**Methodology**:
**Revenue Aggregation**:

 - Using a Common Table Expression (CTE), revenue data is grouped by State to compute the total revenue for each.

**Ranking and Percentage Calculation**:

 - States are ranked in descending order of total revenue.

 - The revenue contribution percentage of each state is calculated relative to the overall total revenue.

 - Cumulative percentages are determined to identify the point where the Top 20% states collectively contribute 80% of the revenue.

**Categorization**:

 - States are classified into Top 20% or Remaining 80% based on their cumulative revenue percentage.

### Purpose:
This analysis seeks to:

 - Identify the states driving the majority of revenue.

 - Assess revenue concentration to inform resource allocation, policy decisions, and investment strategies.

 - Explore the distribution of revenue across states, offering insights into areas with high financial impact and opportunities for growth.


### Top 10
| State        | Total Revenue       | Revenue Percentage | Cumulative Percentage | Pareto Category |
|--------------|---------------------|---------------------|-----------------------|-----------------|
| N/A          | 158018986575.18    | 63.21              | 63.21                | Top 20%         |
| New Mexico   | 35175637979.20     | 14.07              | 77.28                | Top 20%         |
| Wyoming      | 34667303719.14     | 13.87              | 91.15                | Remaining 80%   |
| Colorado     | 5712043519.93      | 2.28               | 93.43                | Remaining 80%   |
| Utah         | 4735421749.09      | 1.89               | 95.33                | Remaining 80%   |
| North Dakota | 4175200562.05      | 1.67               | 97.00                | Remaining 80%   |
| California   | 2422162439.95      | 0.97               | 97.97                | Remaining 80%   |
| Montana      | 1505688789.18      | 0.60               | 98.57                | Remaining 80%   |
| Alaska       | 917168821.82       | 0.37               | 98.93                | Remaining 80%   |
| Texas        | 536596192.43       | 0.21               | 99.15                | Remaining 80%   |



### Insights:
**Key Revenue Drivers (Top 20%)**:

 - The Top 20% of states include N/A (unclassified or offshore revenue) and New Mexico, which collectively contribute 77.28% of total revenue. N/A alone accounts for 63.21%, while New Mexico adds another 14.07%.

**Remaining 80% Contributions**:

 - States classified in the Remaining 80% contribute the remaining 22.72% of revenue. Wyoming, although not in the Top 20%, shows significant contribution (13.87%), making it an essential player.

**Revenue Concentration**:

 - This analysis confirms the Pareto Principle: a minority of states account for the majority of revenue. This concentration indicates the need to prioritize resources and investments in the highest-performing areas.

**Strategic Focus**:

 - Prioritizing operations in states like New Mexico, Wyoming, and unclassified regions (N/A) may yield the most significant returns.

 - Investigating underperforming states (e.g., those contributing 0.01% or less) may uncover hidden opportunities or inefficiencies.

**Opportunities for Growth**:

 - While states in the Remaining 80% individually contribute less, regions like Colorado, Utah, and North Dakota still provide meaningful revenue. Exploring these areas further may help reduce dependency on top contributors.

This analysis provides actionable insights on state-level revenue distribution and highlights opportunities for optimization.


## Moving Average Forecasting

**Objective**: Moving Average Forecasting is a method used to smooth out fluctuations in data over time and identify trends. This analysis calculates the 3-year moving average for total revenue, offering insights into the historical patterns and future projections.

**Methodology**:
**Data Aggregation**:

 - Revenue is aggregated by Calendar_Year using a Common Table Expression (CTE).

**Calculating the Moving Average**:

 - A 3-year moving average is calculated using a window function (AVG) applied over the revenue history, with a sliding window of three rows (two preceding years and the current year).

### Purpose:
This analysis provides:

 - A clearer view of revenue trends, removing the impact of short-term fluctuations.

 - Insights into future projections based on historical patterns.

 - Data to support strategic decision-making by focusing on longer-term performance indicators.


| Calendar Year | Total Revenue       | Moving Average       |
|---------------|---------------------|----------------------|
| 2003          | 8694582697.08      | 8694582697.08       |
| 2004          | 8619528987.52      | 8657055842.30       |
| 2005          | 10552746925.54     | 9288952870.05       |
| 2006          | 13012380921.01     | 10728218944.69      |
| 2007          | 11831299841.17     | 11798809229.24      |
| 2008          | 23485404988.10     | 16109695250.09      |
| 2009          | 8235754310.17      | 14517486379.81      |
| 2010          | 10833934334.55     | 14185031210.94      |
| 2011          | 11674260303.09     | 10247982982.60      |
| 2012          | 13482574507.47     | 11996923048.37      |
| 2013          | 13405177613.12     | 12854004141.23      |
| 2014          | 13486237497.71     | 13457996539.43      |
| 2015          | 8186319672.93      | 11692578261.25      |
| 2016          | 5880956314.81      | 9184504495.15       |
| 2017          | 7657203562.62      | 7241493183.45       |
| 2018          | 11093338080.88     | 8210499319.44       |
| 2019          | 10642840813.41     | 9797794152.30       |
| 2020          | 6673483858.27      | 9469887584.19       |
| 2021          | 11345943831.76     | 9554089501.15       |
| 2022          | 23909575936.92     | 13976334542.32      |
| 2023          | 17289688735.16     | 17515069501.28      |



### Insights:
**Revenue Stability**:

 - The moving average smooths out fluctuations, providing a clearer view of revenue trends. For example, from 2013 to 2014, the moving average consistently reflects stable revenue near the 13 billion mark, showing a period of steady growth.

**Sharp Revenue Peaks**:

 - 2022 exhibits a sharp peak in both total revenue (23.91 billion) and moving average (13.98 billion). This suggests a significant uptick that may correlate with external factors or successful industry initiatives.

**Post-Peak Growth**:

 - The moving average continues to rise in 2023, reaching 17.51 billion, reflecting the lingering effects of the revenue surge in 2022.

**Periods of Decline**:

 - During years like 2015 to 2017, the moving average shows a downward trend from 11.69 billion to 7.24 billion, indicating a sustained dip in financial performance. This period warrants investigation to uncover potential challenges.

**Strategic Applications**:

 - The moving average highlights years of strong performance (e.g., 2008, 2022) and years of decline (e.g., 2015–2017). These insights help in identifying successful strategies or mitigating factors for underperforming periods.

This analysis presents a comprehensive view of revenue trends over time, smoothing out annual fluctuations and highlighting strategic opportunities.


## Linear Trend Analysis

**Objective**: The Linear Trend Analysis seeks to determine the relationship between revenue and time and to forecast future revenue based on this trend. By calculating a linear regression line, we derive a slope and intercept to predict revenue for the next year.

**Methodology**:
**Revenue Aggregation**:

 - Revenue data is grouped by Calendar_Year, calculating the total revenue for each year using a Common Table Expression (CTE).

**Indexing Years**:

 - A new column Year_Index is created to assign a sequential number to each year, enabling numerical operations for linear trend calculation.

**Trend Coefficients**:

 - Using statistical formulas for linear regression, the slope (m) and intercept (b) of the trend line are calculated:

 -- Slope (m): Represents the rate of change in revenue over years.

 -- Intercept (b): Reflects the predicted revenue when the year index is zero.

**Forecasting**:

 - The next year is predicted by applying the linear trend formula:

## Purpose:
This analysis aims to:

 - Understand the historical trends in revenue over time.

 - Provide a forecast for the next year's revenue based on a linear trend.

 - Support stakeholders in strategic planning and decision-making.


| Predicted Year | Predicted Revenue  |
|----------------|--------------------|
| 2024           | 13222987340.35    |


### Insights:
**Predicted Revenue for 2024**:

 - Based on the linear trend analysis, the predicted revenue for 2024 is approximately 13.22 billion. This forecast reflects the historical trends and provides a data-driven estimate of financial performance.

**Trend Implications**:

 - The predicted revenue shows a decline compared to the peak years like 2022 and 2023. This suggests a potential leveling or slight reduction in revenue growth over time.

**Strategic Planning**:

 - The trend can guide stakeholders in preparing for the predicted revenue levels. This might involve focusing on cost optimization, diversifying revenue streams, or increasing efficiency to maximize profitability.

**Comparison with Moving Average**:

 - The moving average for recent years suggests slightly higher revenue trends than this linear forecast. Comparing these models can help refine forecasts by accounting for different perspectives on historical data.
