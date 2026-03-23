### **Architecture Recommendation: Data Lakehouse**

For a fast-growing food delivery startup handling diverse data types—GPS logs, text reviews, payment transactions, and menu images—the most suitable architecture is a **Data Lakehouse**.

Firstly, a Data Lakehouse supports multi-format data storage. The startup deals with structured data (transactions), semi-structured data (GPS logs in JSON), and unstructured data (text reviews and images). Traditional data warehouses struggle with unstructured data, while a lakehouse seamlessly handles all formats in a unified system.

Second, it enables both analytics and real-time processing. The company likely needs real-time insights such as delivery tracking, surge pricing, and fraud detection, alongside batch analytics like customer behavior trends.

Third, it ensures data consistency and governance. With features like schema enforcement, versioning, and transactional support, a lakehouse prevents data quality issues—critical for financial data like payments and for maintaining reliable dashboards.

Additionally, it is cost-efficient and scalable, allowing storage on cheaper object storage while still supporting high-performance queries. As the startup grows rapidly, this flexibility avoids costly migrations later.
