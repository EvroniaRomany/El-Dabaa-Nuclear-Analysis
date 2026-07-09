# El Dabaa Nuclear Analysis

## 1. Objective

Evaluate global nuclear power plant operational and financial data to build a data-driven argument for why the VVER-1200 reactor is a strong technological and economic choice for Egypt's **El Dabaa Nuclear Power Plant**, and communicate the findings to three audiences: investors, government/policy makers, and the general public.

## 2. Dataset

- Source file:`excel/nuclear_dataset.xlsx`
- Main table:`Table1` — 3,168 rows × 53 columns
- Grain:one row = one plant-month observation
- Key fields:

| Category | Example Columns |
|---|---|
| Identification | `Plant_ID`, `Plant_Name`, `Country`, `Region`, `Operator` |
| Reactor Info | `Reactor_Type`, `Reactor_Model`, `Generation`, `Commissioning_Year` |
| Time | `Date`, `Year`, `Month`, `Quarter` |
| Performance | `Capacity_Factor`, `Availability`, `Energy_Generated_MWh` |
| Financials | `Revenue_USD`, `Total_Operating_Cost_USD`, `Net_Profit_USD`, `ROI`, `Profit_Margin` |
| Costs breakdown | `Fuel_Cost_USD`, `Maintenance_Cost_USD`, `Staff_Cost_USD`, `Insurance_Cost_USD`, `Security_Cost_USD`, etc. |
| Safety/Reliability | `Forced_Outage_Hours`, `Scheduled_Outage_Hours`, `Unexpected_Shutdown`, `Safety_Events` |
| Market context | `Market_Demand_Index`, `Grid_Load`, `Fuel_Price_Index`, `Inflation_Rate` |

A summary `pivot table` sheet is also included with high-level KPIs (# Plants, # Countries, # Regions, Installed Capacity, # Reactor Models, # Reactor Types).


## 3. Python — Exploratory Data Analysis

Steps performed:
1. Load the dataset with `pandas.read_csv`.
2. Inspect shape, head, tail, and a random sample.
3. Review column info and data types (`df.info()`, `df.dtypes`).
4. Statistical summary for numeric and categorical columns (`df.describe()`).
5. Explore categorical distributions (unique/nunique countries, top value counts).
6. Check for missing values and duplicate rows.

## 4. SQL Star Schema & Analytical Queries
Schema

| Table | Role | Key Columns |
| `fact` | Fact table | `Reactor_idd`, `Plant_ID`, `date_idd`, `Capacity_Factor`, `Availability`, `ROI`, `Net_Profit_USD`, `Revenue_USD`, `Total_Operating_Cost_USD`, `Maintenance_Cost_USD` |
| `Dim_Reactor` | Reactor dimension | `Reactor_ID`, `Reactor_Type`, `Reactor_Model` |
| `Dim_Plant` | Plant dimension | `Plant_ID`, `Plant_Name`, `Country` |
| `Dim_Date` | Date dimension | `Date_ID`, `Year` |

### Query Catalog

| # | Question | Technique |
| 1 | Best reactor type for Egypt (VVER)? | `AVG`, multi-metric ranking |
| 2 | Plants/countries with capacity factor > 80% | `HAVING`, `TOP` |
| 3 | Avg operating cost per reactor type/model | `GROUP BY` (2 dims) |
| 4 | Avg ROI per reactor type | `AVG`, `GROUP BY` |
| 5 | Plants with revenue > $1B | `SUM`, `HAVING` |
| 6 | Plant count per country | `COUNT`, `GROUP BY` |
| 7 | Avg revenue per year | Join to `Dim_Date` |
| 8 | Highest avg electricity generation by country | `AVG`, `ORDER BY` |
| 9 | Reactor type with highest total net profit | `SUM`, `TOP` |
| 10 | Total revenue — top 5 countries/plants | `SUM`, `TOP` |
| 11 | Total maintenance cost per reactor type | `SUM`, `GROUP BY` |
| 12 | Performance classification (Excellent/Good/Average/Poor) | `CASE WHEN` |
| 13 | Reactor types with avg ROI > 20% | `HAVING AVG(...) > 20` |

 Key formulas used in the analysis
-Availability (%)= (Total period hours / Total availability-ready hours) × 100
- ROI (%)= (Net Profit / Capital Investment) × 100

5. Power BI Dashboard
- Built on top of the same dataset the SQL star schema.
- Provides interactive filtering by country, reactor type, and year.
- Visualizes capacity factor, ROI, revenue, and cost-structure comparisons across plants.

