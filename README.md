# 📦 NexChain Logistics – EMEA Shipment Performance Analysis  
![SQL Enpoint Analytics](https://img.shields.io/badge/SQL-Fabric_Gen2-blue?logo=sql)
![PowerBI](https://img.shields.io/badge/PowerBI-Dashboard-yellow?logo=powerbi)
![Fabric](https://img.shields.io/badge/Fabric-Data_Platform-purple?logo=microsoft)
![Status](https://img.shields.io/badge/Project_Status-Completed-brightgreen)

---

## Table of Contents  
- [Project Background](#-project-background)  
- [ Insights & Recommendations Overview](#-insights--recommendations-overview)  
- [Data Structure & Initial Checks](#-data-structure--initial-checks)  
- [Executive Summary](#-executive-summary)  
- [Insights Deep Dive](#-insights-deep-dive)  
  - [Shipment Trends & Delay Rates](#shipment-trends--delay-rates)  
  - [OpCo Performance Overview](#opco-performance-overview)  
  - [Warehouse & Hub Efficiency (EDC Focus)](#warehouse--hub-efficiency-edc-focus)  
  - [Seasonal & Operational Factors](#seasonal--operational-factors)  
- [Recommendations](#-recommendations)  
- [Assumptions & Caveats](#️-assumptions--caveats)  
- [Final Remarks](#-final-remarks)

---

## 🏢 Project Background  

NexChain Logistics, founded in 1980, is a EMEA supply chain and logistics company operating across 27 Operating Companies (OpCos) in the region. The company’s business model focuses on managing end-to-end office supplies shipments from Distribution Centers to local OpCos and end customers.  

Every year, NexChain accumulates millions of shipment records. However, these datasets were historically underultilized for performance optimization. As part of the Supply Chain Analytics initiative, I collaborate with the Head of Supply Chain and Order Fulfillment to:  
- Extract insights and develop recommendations to improve shipment delays.  
- Build a Power BI dashboard for operational leads to track underperforming OpCos, product lines, and delivery delay trends.

The goal was to improve on-time delivery, reduce in-transit inventory, and optimize workload allocation across NexChain’s EMEA network.  

---

## 🧱 Data Structure & Initial Checks  

The dataset originates from the Fabric Gen2 Data Flow, imported into the Lakehouse SQL Analytics Endpoint for analysis. It contains approximately 5 million shipment records spanning May 2024 – March 2025.  

Each record represents a shipment order, detailing the origin warehouse, destination Operating Company (OpCo), actual dispatch date, planned arrival date, and expected delivery date. The delivery gap metric, pre-calculated by the Supply Chain team, already accounts for weekends and local holidays. Information on the actual received date is not available in the dataset.

Database tables:  
- Table 1: Shipment_Analysis_EMEA – Core shipment data (OpCo, source warehouse, planned vs. actual shipment dates, calculated delay gap).  
- Table 2: OpCo_Master – Operating company reference data including country, operational type (direct/indirect), and region.  
- Table 3: Warehouse_Master – Hub and satellite warehouse hierarchy and metrics.  
- Table 4: Calendar_Dimension – Date intelligence including holidays and working day flags.  

Entity Relationship Diagram:  
![ERD](https://github.com/user-attachments/assets/995ff790-02e8-40b2-a9a3-efc6fbe155e7)

To focus on the most importance metrics and key performers, Order Fulfillment team agreed on the following data scopes:
- Excluded outliers of delivery gaps exceeding 100 days.  
- Limited analysis to Direct OpCos 
- Removed indirect and intercompany shipments.  
- Validated missing delivery dates against dispatch logs (0.8% imputed).
  
- [SQL Cleaning & Preprocessing Queries](link)  
- [Targeted Business Question Queries](link)  
- [Shipment Sample Data](link)  

---

## 💼 Executive Summary  
NexChain's shipments analysis of 5M records across May 2024- March 2025 shows monthly deliveries averaging 460k across 27 Operating Companies, with five key OpCos: Germany, France, Spain, Italy, and the UK account for 80% of total delayed shipments. Shipping warehouse EDC processes 66% of all deliveries, specializing in France, though cooperations with the UK, Italy and Germany is a concern with 60-70% delayed rate. Targeted the top 5 OpCos, along with improving the workflow of the main shipping hub EDC, will yield the greatest reduction in delay frequency and duration. NexChain can benefit from strategic shipment forecast for summer and holiday periods, to tackle long in-transit month (August) and high volumn month (September). This will improve communication, customer satisfaction and minimize associate cost. 

---

## 🔍 Delayed Shipments Deep Dive  

### Order Analysis Dashboard
<img width="1245" height="737" alt="Delayed Shipment Analysis" src="https://github.com/user-attachments/assets/54b16d10-173b-47a0-9808-36796e502b04" />

### Shipment Trends & Delay Rates  
<img width="886" height="257" alt="Overview" src="https://github.com/user-attachments/assets/199af69c-2c2a-45fc-9d8c-6d7acca3709f" />

- Out of 5M total shipments, 1M were delayed (23% delay ratio, 5-day average delay).  
- Germany recorded the highest volume of delayed orders (190K; 26% delayed).  
- Spain had the highest delay ratio (40%), nearly every second order delayed.  
- 88% of all delays were less than one week, classified as typical delay. 

---

### OpCo Performance Overview  
<img width="780" height="386" alt="Top 5 OpCOs" src="https://github.com/user-attachments/assets/c984207f-57ed-4f8f-868a-9b6e083c2b8e" />

<img width="685" height="692" alt="No  Delayed" src="https://github.com/user-attachments/assets/de3a10a8-3d8a-439e-b742-2097677a9be0" />

- The top 5 OpCos accounted for 63% of shipments and 80% of delays.  
- Peak delay months were July (83K delayed) and September (91K delayed).  
- Delay trends shifted seasonally:  
  - May–October 2024: Spain and Germany dominated.  
  - November 2024–March 2025: France became the main driver.
    
---

### Warehouse & Hub Efficiency (EDC Focus)  

 No. of Shipment by Warehouse             | Distribution OpCo by EDC  
:-------------------------:|:-------------------------:
  <img width="402" height="182" alt="Warehouse" src="https://github.com/user-attachments/assets/89a14f3d-fa2b-4f40-9cd2-8570454fd87e" />
 | <img width="393" height="182" alt="EDC" src="https://github.com/user-attachments/assets/59a9b851-089f-4f9b-93fb-db7865304136" />

- EDC handled 63% of all shipments.  
- EDC’s outbound performance varied by destination:  
  - France: 15% delayed  
  - Italy: 72% delayed  
  - Spain/UK: ~65% delayed  
- EDC overload correlated with high outbound volume in July–September.  

---

### Seasonal & Operational Factors  
<img width="502" height="512" alt="longest duration" src="https://github.com/user-attachments/assets/8bb8f670-2fd1-41b9-b2fe-cc8319591d4e" />

- France’s delivery time peaked at 27 days in August due to summer workforce shortages.  
- Delays spiked post-holiday (September) due to capacity recovery lag.  
- These predictable cycles suggest the need for demand forecasting and better shift scheduling.  

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

**Tools Used:** SQL Endpoint Analytics, Dataflow Gen2, Fabric Lakehouse, Power BI, Excel  

*Authored by: Minh Nguyen — Business Intelligence Developer, Data Analyst*  
*Linkedin: www.linkedin.com/in/minh-n-nguyen*
*Email: mim.n.nguyen@gmail.com* 


