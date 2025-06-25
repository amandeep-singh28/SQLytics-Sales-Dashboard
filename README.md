# SQLytics Sales Dashboard 🧠📊

An interactive and dynamic sales dashboard built using **Python, MySQL, and Excel**. Designed to extract insights from Superstore data using **SQL queries**, **Power Pivot**, **Pivot Tables**, **KPIs**, and **interactive charts** — all integrated through an ODBC connection for a seamless, real-time analytics experience.

---

## 🧩 1. Project Workflow Overview

This project follows a proper **ETL pipeline** using three major tools:

- **Python (Pandas)**: Used for data cleaning, preprocessing, and splitting the main dataset into three relational tables (`customers.csv`, `products.csv`, `orders.csv`).
- **MySQL Workbench**: Cleaned datasets were imported as SQL tables, and powerful queries were executed to derive business insights.
- **Excel (via ODBC connection)**: Data was pulled dynamically from MySQL into Excel using Power Pivot. KPIs, Pivot Tables, Slicers, and Charts were used to build the final interactive dashboard.

---

## 🧹 2. Data Cleaning (in Python)

- Removed duplicates and empty rows.
- Handled missing values.
- Created a unique `customer_id` for each customer.
- Split the master dataset into:
  - `customers` – name, segment, region, etc.
  - `products` – product name, category, sub-category.
  - `orders` – order ID, dates, quantity, sales, discount, profit, shipping cost.

---

## 💾 3. SQL Database & Queries

After importing data into MySQL Workbench, the following queries were executed to extract meaningful insights:

- **Order with Shipping Delay > 5 Days** – Calculated using `DATEDIFF(ship_date, order_date)`.
- **Percentage of Total Sales** – Customer-wise or product-wise share of total sales.
- **Profit by Region** – `SUM(profit)` grouped by region.
- **Rank Customers by Total Sales** – Used `RANK()` window function.
- **Running Total Sales by Year** – Used window function for cumulative sales trend.
- **Sales by Order Priority** – Grouped by order priority.
- **Sales by Sub-Category** – Insight into performance by sub-category.
- **Top 10 Customers by Total Sales**
- **Top 10 Products by Total Sales**
- **KPIs**: Total sales, quantity, profit for dashboard blocks.
- **Yearly Sales Trend Analysis**

> ✅ All queries were tested and saved for reference.

---

## 📊 4. Excel Dashboard (via ODBC)

### 🔷 KPIs Block (Top Section)

- Total Orders  
- Total Sales  
- Total Profit  
- Average Discount  
- Total Quantity  

> 🎨 *Enhancements*: Added GIFs and Icons for creative visual appeal.

---

### 🔷 Pivot Tables Created

- Month vs. Sales  
- Customer Name vs. Sales  
- Month vs. Profit  
- Region vs. Sales  

---

### 🔷 Graphs Created

- **Line Plot**: Monthly Sales Trend  
- **Bar Plot (Interactive)**:
  - Quantity
  - Above Average Quantity
  - Average Quantity
  - ✅ *Interactive buttons toggle between Sales, Profit, Shipping Cost, Quantity*
- **Bar Plot**: Top 5 Customers by Sales  
- **Bar Plot**: Region-wise Sales  

---

### 🔷 Filters & Slicers (Fully Dynamic)

- Year  
- Month  
- Region  
- Week  
- *(Country slicer customized to include selected countries only)*

---

## 📌 5. Design & Layout Features

- Followed a **modern dark theme** (black and blue tones).
- Used **shapes and alignment techniques** for layout.
- Added **titles, slicers, KPIs, and visuals** as shown in reference image.
- Created **navigation panel** using buttons and shapes for easy movement across the dashboard.

---

## 📎 6. Final Thoughts

- ✅ **Dynamic Dashboard**: All visuals respond to slicers in real-time via SQL-Excel ODBC connection.
- ✅ **Professional Structure**: Clean, responsive layout.
- ✅ **Scalable Design**: Easy to extend with more KPIs or visualizations.

---

> 🙌 Built with dedication, creativity, and pure Excel + SQL power!
