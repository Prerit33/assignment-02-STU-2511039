## ETL Decisions

### Decision 1 — Standardizing the Date Formats

**Problem:** The raw dataset contained inconsistent date formats (e.g., `DD-MM-YYYY`, `MM/DD/YYYY`, and text-based formats), which would cause issues in joins and time-based analysis.

**Resolution:** All dates were transformed into a consistent `YYYY-MM-DD` format during the ETL process. A surrogate key (`date_id`) was generated and mapped to each unique date in the `dim_date` table to ensure consistency and efficient querying.

---

### Decision 2 — Handling NULL and Missing Values

**Problem:** Some records had NULL or missing values in critical fields such as `quantity` and `store`. This could lead to incorrect aggregations or broken foreign key relationships.

**Resolution:** * Missing `quantity` values were replaced with a default value of `1` to avoid undercounting sales.
* Missing or inconsistent store values were standardized and mapped to a valid entry in `dim_store`.
* Records with critical missing identifiers were either corrected (if possible) or excluded from the fact table to maintain data integrity.

---

### Decision 3 — Standardizing Product Categories and Text Fields

**Problem:** Product categories and names had inconsistent casing and formatting (e.g., `"electronics"`, `"ELECTRONICS"`, `"Electronics"`), which would fragment reporting and produce incorrect aggregations.

**Resolution:** All text fields were cleaned by applying consistent formatting rules:

* Converted categories to **proper case** (e.g., `"Electronics"`)
* Trimmed whitespace and removed duplicates
* Ensured each product maps to a single, standardized category in `dim_product`

