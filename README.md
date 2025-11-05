# 📦 NexChain Logistics – EMEA Shipment Performance Analysis  
*Data-Driven Insights into Delivery Efficiency and Operational Bottlenecks (May 2024 – March 2025)*  

![SQL](https://img.shields.io/badge/SQL-Fabric_Gen2-blue?logo=sql)
![PowerBI](https://img.shields.io/badge/PowerBI-Dashboard-yellow?logo=powerbi)
![Tableau](https://img.shields.io/badge/Tableau-Interactive-orange?logo=tableau)
![Python](https://img.shields.io/badge/Python-Data_Cleaning-blue?logo=python)
![Status](https://img.shields.io/badge/Project_Status-Completed-brightgreen)

---

## 📖 Table of Contents  
- [🏢 Project Background](#-project-background)  
- [🧭 Insights & Recommendations Overview](#-insights--recommendations-overview)  
- [🧱 Data Structure & Initial Checks](#-data-structure--initial-checks)  
- [💼 Executive Summary](#-executive-summary)  
- [🔍 Insights Deep Dive](#-insights-deep-dive)  
  - [Category 1: Shipment Trends & Delay Rates](#category-1-shipment-trends--delay-rates)  
  - [Category 2: OpCo Performance Overview](#category-2-opco-performance-overview)  
  - [Category 3: Warehouse & Hub Efficiency (EDC Focus)](#category-3-warehouse--hub-efficiency-edc-focus)  
  - [Category 4: Seasonal & Operational Factors](#category-4-seasonal--operational-factors)  
- [💡 Recommendations](#-recommendations)  
- [⚙️ Assumptions & Caveats](#️-assumptions--caveats)  
- [🧩 Final Remarks](#-final-remarks)

---

## 🏢 Project Background  

NexChain Logistics, founded in 1960, is a global supply chain and logistics company operating across 27 Operating Companies (OpCos) in the EMEA region. The company’s business model focuses on managing end-to-end shipment operations from centralized European Distribution Centers (EDCs) to local OpCos and end customers.  

Over the decades, NexChain has accumulated millions of shipment records. However, these datasets were historically underused for performance optimization.  

As part of the Supply Chain Analytics initiative, I collaborated with the Head of Supply Chain and Order Fulfilment to:  
- Extract insights and develop recommendations to improve shipment delays.  
- Build a Power BI dashboard for operational leads to track underperforming OpCos, product lines, and delivery delay trends.  

The goal was to improve on-time delivery, reduce in-transit inventory, and optimize workload allocation across NexChain’s EMEA network.  

---

## 🧭 Insights & Recommendations Overview  

Analysis focused on the following areas:  
- Category 1: Overall Shipment Trend & Delay Rates  
- Category 2: OpCo Performance Analysis  
- Category 3: Warehouse & Hub Efficiency  
- Category 4: Seasonal and Operational Factors  

The full analytical workflow can be found here:  
- [SQL Cleaning & Preprocessing Queries](link)  
- [Targeted Business Question Queries](link)  
- [Interactive Tableau Dashboard](link)  

---

## 🧱 Data Structure & Initial Checks  

The dataset originates from the Fabric Gen2 Data Flow, imported into the Lakehouse SQL Analytics Endpoint for analysis. It contains approximately 5 million shipment records spanning May 2024 – March 2025.  

Database tables:  
- Table 1: Shipment_Analysis_EMEA – Core shipment data (OpCo, source warehouse, planned vs. actual shipment dates, calculated delay gap).  
- Table 2: OpCo_Master – Operating company reference data including country, operational type (direct/indirect), and region.  
- Table 3: Warehouse_Master – Hub and satellite warehouse hierarchy and metrics.  
- Table 4: Calendar_Dimension – Date intelligence including holidays and working day flags.  

Entity Relationship Diagram:  
*(Insert ERD visualization here)*  

Initial Checks & Scope:  
- Excluded delivery gaps exceeding 100 days.  
- Limited analysis to Direct OpCos.  
- Removed indirect and intercompany shipments.  
- Validated missing delivery dates against dispatch logs (0.8% imputed).  

---

## 💼 Executive Summary  

Between May 2024 and March 2025, NexChain processed approximately 5 million shipments, averaging 460K monthly deliveries across 27 OpCos.  

Key findings:  
- 80% of delayed shipments originated from five key OpCos: Germany, France, Spain, Italy, and the UK.  
- France had the longest delivery times, peaking at 27 days in August 2024.  
- 66% of all shipments came from the main EDC hub, which experienced frequent overload during seasonal peaks.  

Focusing improvement efforts on the top 5 OpCos and the main hub will yield the greatest reduction in delay frequency and duration.  

![Dashboard Overview](Assets/Dashboard_Snapshot.png)  

---

## 🔍 Insights Deep Dive  

### Category 1: Shipment Trends & Delay Rates  
- Out of 5M total shipments, 1M were delayed (23% delay ratio, 5-day average delay).  
- Germany recorded the highest volume of delayed orders (190K; 26% delayed).  
- Spain had the highest delay ratio (40%), nearly every second order delayed.  
- 88% of all delays were less than one week.  

Recommendation:  
Add a Delay Severity classification in reports to separate operational from structural causes.  

---

### Category 2: OpCo Performance Overview  
- The top 5 OpCos accounted for 63% of shipments and 80% of delays.  
- Peak delay months were July (83K delayed) and September (91K delayed).  
- Delay trends shifted seasonally:  
  - May–October 2024: Spain and Germany dominated.  
  - November 2024–March 2025: France became the main driver.  

![OpCo Delay Comparison](Assets/OpCo_Delay_Chart.png)  

Recommendation:  
Use OpCo-level heatmaps and quarterly reviews to target persistent underperformance.  

---

### Category 3: Warehouse & Hub Efficiency (EDC Focus)  
- EDC handled 63% of all shipments.  
- EDC’s outbound performance varied by destination:  
  - France: 15% delayed  
  - Italy: 72% delayed  
  - Spain/UK: ~65% delayed  
- EDC overload correlated with high outbound volume in July–September.  

Recommendation:  
Use dynamic load balancing by rerouting shipments to satellite hubs during high-demand periods.  

---

### Category 4: Seasonal & Operational Factors  
- France’s delivery time peaked at 27 days in August due to summer workforce shortages.  
- Delays spiked post-holiday (September) due to capacity recovery lag.  
- These predictable cycles suggest the need for demand forecasting and better shift scheduling.  

![Seasonal Shipment Patterns](Assets/Seasonal_Patterns.png)  

---

## 💡 Recommendations  

1. Prioritize Spain, Germany, and France for root-cause investigation and targeted improvement.  
2. Distribute EDC shipment load among satellite hubs during high-demand months.  
3. Implement shipment cycle forecasting to anticipate summer and post-holiday peaks.  
4. Improve coordination between EDC and OpCos for real-time schedule visibility.  
5. Build Power BI KPI dashboards (Average Delay Days, On-Time Rate, Volume by OpCo) for weekly performance tracking.  

---

## ⚙️ Assumptions & Caveats  

- Shipment gap values already adjusted for weekends and holidays.  
- Missing received dates were excluded.  
- Outliers with >100-day delay removed (0.2%).  
- Intercompany transfers excluded from scope.  
- Workforce impact during holidays assumed based on HR staffing data and shipment trends.  

---

## 🧩 Final Remarks  

This analysis provides NexChain with a quantitative foundation for improving on-time delivery and operational visibility.  
Targeted regional optimization, better warehouse balancing, and proactive forecasting are expected to achieve:  
- 8–12% improvement in on-time delivery rates.  
- Reduced in-transit inventory.  
- Higher customer satisfaction and SLA compliance.  

---

**Developed by:** [Your Name] – Data Analyst, Supply Chain Analytics  
**Project Duration:** May 2024 – March 2025  
**Tools Used:** SQL (Fabric Gen2), Power BI, Tableau, Python, Excel  

