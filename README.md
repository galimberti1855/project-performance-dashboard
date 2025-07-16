# project-performance-dashboard
A Power BI dashboard that tracks cost and schedule performance across renewable energy projects using CPI, SPI, and time variance KPIs.
Built With:
• SQL Server – to structure and calculate CPI, SPI, and time variance
• Power BI – to visualize task timelines, project status, and KPIs
• Excel – to prep and clean raw project data

 
What the Dashboard Shows:
• Cost Performance Index (CPI): Are we under or over budget?
• Schedule Performance Index (SPI): Are we ahead or behind schedule?
• Time Variance: Difference between planned and actual work hours
• Task Progress (% Completion) with a Gantt-style timeline
• Color-coded status: On Track, Over Budget, Behind Schedule
 
Each project tells a different story:
• Solar – On time and on budget (SPI > 1, CPI > 1)
• Wind – On time but over budget (SPI > 1, CPI < 1)
• Hydro – Behind schedule but spent more (SPI < 1, CPI > 1)
