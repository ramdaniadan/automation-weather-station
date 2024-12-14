# ETL Automation for Weather Station Data

This repository contains an automated ETL pipeline for managing weather station data using **Pentaho Data Integration (PDI)**. It integrates various weather station data sources, processes the data, and provides reports for monitoring and operational needs. The system is divided into three main jobs:

1. **DailyAutoCollectDataAWS**: Automates data collection from weather stations.
2. **DailyAutoSummaryDataAWS**: Summarizes collected data and sends reports to the internal IT team.
3. **AWSAutoReportToOC**: Creates weekly reports for each Operating Center (OC) to notify of missing or incorrectly formatted data.

---

## 📖 **Project Overview**

### **Workflow Summary**

- **DailyAutoCollectDataAWS**: Collects data, uploads it to a SQL Server database, and stores a backup copy in the local directory.
- **DailyAutoSummaryDataAWS**: Automatically runs after data collection, generates summaries, and sends monitoring reports to the IT team.
- **AWSAutoReportToOC**: Sends weekly alerts to OCs only if data issues are detected (missing or incorrect format). No alerts are sent if data is complete.

### **Supported Weather Station Types**

1. **Davis**
2. **Watchdog**
3. **Meteo**
4. **Unidata**
5. **Manual (Ombrometer)**

---

## 🔄 **Data Flow**

### **Data Collection Workflow**

1. **Data Sources**:

   - **Davis, Watchdog, Meteo**: Input files in `.txt` format.
   - **Unidata, Manual (Ombrometer)**: Input files in `.xlsx` format.

2. **Process**:

   - Data is loaded into a **SQL Server database**.
   - Original files are saved as **backup** in a local directory.

### **Automation**

- **DailyAutoSummaryDataAWS** runs automatically after **DailyAutoCollectDataAWS** finishes.
- Reports are sent based on the latest collected data.

---

## 📂 **Directory Structure**

```plaintext
📂 automation-weather-station
|   README.md
|
+---AWSAutoReportToOC
|   +---Excel
|   |   |   email-list.xlsx
|   |   |   Template-invalid.xlsx
|   |   |   Template-report.xlsx
|   |   |
|   |   +---Davis
|   |   +---Manual
|   |   +---Meteo
|   |   \---Watchdog
|   +---HTML
|   +---Job
|   |   |   JOB_AutoReportToOC.kjb
|   |   |   SJB_Excel_to_HTML.kjb
|   |   |   SJB_Report_Davis.kjb
|   |   |   SJB_Report_Manual.kjb
|   |   |   SJB_Report_Meteo.kjb
|   |   |   SJB_Report_Watchdog.kjb
|   |   \---Transformation
|   +---XML
|   \---XSL
|
+---DailyAutoCollectDataAWS
|   |   JOB_AWS.kjb
|   +---DAVIS
|   +---ECOWITT
|   +---MANUAL
|   +---METEO
|   +---UNIDATA
|   \---WATCHDOG
|
\---DailyAutoSummaryDataAWS
    +---Excel
    +---HTML
    +---Job
    +---XML
    \---XSL
```

---

## 🚀 **Getting Started**

### **1. Clone the Repository**

```bash
git clone https://github.com/ramdaniadan/automation-weather-station.git
```

### **2. Install Dependencies**

Ensure Pentaho Data Integration is installed. Place `.kjb` and `.ktr` files in the appropriate directories.

### **3. Configure Database and Email SMTP**

- **Database Setup**:  
  Before running the jobs, make sure that your **SQL Server** database is properly set up to store the collected data. Update the connection details in the Pentaho jobs (`.kjb`) and transformations (`.ktr`) to point to your database.

- **Email SMTP Configuration**:  
  Update the email configuration in the `email-list.xlsx` file and ensure that your SMTP settings are correct for sending reports. You may need to specify SMTP server address, port, username, password, and sender/recipient details in the corresponding transformation or job files.

### **4. Configure Files**

Update configuration files (e.g., `email-list.xlsx`) to match your system requirements.

### **5. Run the Jobs**

Run the jobs in sequence or set up a scheduler for automation.

---

## 📊 **Features**

- **Automated Data Collection**: Streamlines the ingestion of weather station data.
- **Backup System**: Ensures raw data is securely stored locally.
- **Error Reporting**: Alerts OCs of missing or incorrect data.
- **Summary Reports**: Provides internal IT teams with insights into collected data.

---

## 📘 **Technologies Used**

| Technology               | Function                            |
| ------------------------ | ----------------------------------- |
| Pentaho Data Integration | ETL Process                         |
| SQL Server               | Data storage for transformed data   |
| Excel                    | Output format for reports           |
| HTML & XML               | Web-based report formats            |
| XSL                      | XML to HTML transformation          |

---

## 🛠️ **Development**

This project can be further developed to support:

- Additional weather station types.
- Data visualization using dashboards.

---

## 📬 **Contact**

For any issues or inquiries, please contact:

- **Email**: [ramdaniadan1212@gmail.com](mailto\:ramdaniadan1212@gmail.com)
- **GitHub**: [https://github.com/ramdaniadan](https://github.com/ramdaniadan)

---

Thank you for visiting this repository! 🌟 If you find it useful, please give it a star and share it with others. 🙌
