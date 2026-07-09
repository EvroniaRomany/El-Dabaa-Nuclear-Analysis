# 🇪🇬 El Dabaa Nuclear Power Plant — Data Analysis Project

![Banner](images/Untitled%20-%20Frame%201.jpg)
> **Why did Egypt choose Russian VVER-1200 technology for its first nuclear power plant?**
> A full data-analysis project (SQL + Python + Power BI + PowerPoint) exploring cost, profitability, safety, and strategic impact using real-world operational data from **24 nuclear plants worldwide (2015–2024)**.

![Status](https://img.shields.io/badge/status-completed-brightgreen)
![SQL](https://img.shields.io/badge/SQL-SQL%20Server-blue)
![Python](https://img.shields.io/badge/Python-Pandas-yellow)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811)

---

## 📌 Project Overview

This project analyzes a dataset of **3,168 records × 53 columns** covering the operational, financial, and safety performance of nuclear power plants across the world, in order to evaluate and justify Egypt's choice of the **VVER-1200 (Generation III+)** reactor technology for the **El Dabaa Nuclear Power Plant**.

The analysis covers:
- Reactor performance (Capacity Factor, Availability, ROI)
- Financial performance (Revenue, Operating Cost, Net Profit)
- Country/plant-level comparisons
- Safety and reliability indicators
- Strategic and economic impact on Egypt

The end deliverable is a **business presentation** (PowerPoint) supported by a **Power BI dashboard**, backed by **SQL Server** analytical queries and a **Python/Pandas** data-exploration workflow.

---

## 🗂️ Repository Structure

```
El-Dabaa-Nuclear-Analysis/
│
├── README.md                      # Project overview (this file)
├── docs/
│   └── DOCUMENTATION.md           # Full technical documentation
│
├── sql/
│   └── nuclear_analysis_queries.sql   # 13 analytical SQL Server queries
│
├── python/
│   └── data_exploration.py        # Pandas exploratory data analysis (EDA) script
│
├── excel/
│   └── nuclear_dataset.xlsx       # Source dataset + pivot table (Table1 sheet, 3168 rows)
│
├── powerbi/
│   └── El_Dabaa_Dashboard.pbix    # Interactive Power BI dashboard


## 🛠️ Tools & Tech Stack

| Tool | Purpose |
|---|---|
| **SQL Server (T-SQL)** | Data modeling (star schema) + analytical queries |
| **Python (Pandas)** | Data cleaning & exploratory data analysis |
| **Microsoft Excel** | Data staging, pivot tables |
| **Power BI** | Interactive dashboard & visualization |
| **PowerPoint** | Final stakeholder-facing presentation |

## 🧩 Data Model

The SQL analysis uses a **star schema**:

- **`fact`** — the fact table (capacity factor, ROI, revenue, costs, profit, etc.)
- **`Dim_Reactor`** — reactor type & model..
- **`Dim_Plant`** — plant name & country..
- **`Dim_Date`** — year, month, quarter..
- **`Dim_market`** — fuel_price_index, grid_load, inflation_rate,...

## ❓ Key Business Questions Answered

1. Why is the VVER reactor the best choice for Egypt?
2. Which countries/plants have an average capacity factor above 80%?
3. What is the average operating cost per reactor type?
4. What is the average ROI per reactor type?
5. Which plants generated more than $1 billion in revenue?
6. How many nuclear plants does each country operate?
7. What is the average revenue trend per year?
8. Which countries have the highest average electricity generation?
9. Which reactor type generated the highest total net profit?
10. What is the total revenue for the top 5 countries?
11. What is the total maintenance cost per reactor type?
12. How does each record perform (Excellent / Good / Average / Poor) based on capacity factor?
13. Which reactor types have an average ROI greater than 20%?

Full query set: [`sql/nuclear_analysis_queries.sql`](sql/nuclear_analysis_queries.sql)
## 📊 Key Findings (Summary)

- The **VVER-1200** reactor shows the **lowest capital cost per MW** among Generation III+ reactors worldwide.
- El Dabaa's 4-unit design gives it the **highest total revenue potential** among compared plants by spreading infrastructure cost.
- Fuel and labor together represent **~65%** of El Dabaa's monthly operating cost structure.
- The project is projected to reduce Egypt's carbon emissions by **14 million tonnes/year**.

*(Full detail available in the presentation and Power BI dashboard.)*
## 🚀 How to Explore This Project

1. **SQL**: Open `sql/nuclear_analysis_queries.sql` in SQL Server Management Studio (SSMS) against a database with the `fact`, `Dim_Reactor`, `Dim_Plant`, and `Dim_Date` tables.
2. **Python**: Run `python/data_exploration.py` (requires `pandas`) to reproduce the exploratory data analysis.
3. **Power BI**: Open `powerbi/El_Dabaa_Dashboard.pbix` in Power BI Desktop to interact with the dashboard.
4. **Presentation**: Open `presentation/El_Dabaa_Nuclear_Presentation.pptx` for the full narrative and findings.

See [`docs/DOCUMENTATION.md`](docs/DOCUMENTATION.md) for full technical details.
## 👤 Author

Project developed as part of the **NTI Data Analysis** training program (Final Project).

