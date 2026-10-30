# UNIVERSITY OF MUMBAI
## T.Y. B.Sc. Computer Science (NEP 2020)
### PROJECT SYNOPSIS & SYSTEM DOCUMENTATION

| Parameter | Details |
| :--- | :--- |
| **Academic Year** | 2026-2027 |
| **Project Title** | Pharmacy Management System |
| **Student Name** | Ritika Sharma |
| **Roll No.** | 23 |
| **PRN / Seat No.** | [As Assigned] |
| **Project Guide** | Prof. Jayshree Patade |
| **Department** | Computer Science |

---

## 1. Introduction
The **Pharmacy Management System** is a modern web-based enterprise application designed to simplify and automate the daily operations of a pharmaceutical dispensary and retail chemist. It helps manage medicine records, inventory levels, sales billing counter (POS), supplier procurement, purchase orders, and medicine expiry dates in an organized, digital manner. 

The system provides intelligent features such as live stock monitoring, low-stock threshold alerts, expiry date surveillance (expired & expiring soon < 30 days), rapid medicine search by generic molecules and brand names, printable GST tax receipts, and audit intelligence reports. It minimizes manual bookkeeping errors, prevents dispensing expired drugs, improves inventory turnover, and enables pharmacy staff to conduct daily commercial and clinical dispensing activities with maximum efficiency.

---

## 2. Objectives
- **Manage Medicine Records & Inventory:** Maintain digital cataloging of drugs with generic molecules, strength, brand names, batch numbers, storage requirements, and physical rack/shelf locations.
- **Automated Expiry & Low Stock Alerts:** Proactively detect batches approaching expiration (< 30 days) and items falling below minimum safe thresholds to avert stockouts and drug wastage.
- **Streamlined Sales & POS Billing:** Enable rapid over-the-counter billing with live inventory stock validation, multi-mode payment handling (Cash, UPI, Card), and automated tax receipt generation.
- **Supplier & Procurement Management:** Record wholesale purchases from licensed distributors and automatically increment warehouse inventory counts upon intake.
- **Secure Role-Based Access:** Enforce authenticated access for Admins, Pharmacists, and Cashiers using encrypted passwords and JWT tokens.
- **Business Intelligence & Reporting:** Deliver visual dashboards depicting daily revenues, fast-moving vs. slow-moving formulations, and valuation margins.

---

## 3. Scope of the Project
The application serves as the core operational operating system for a medical store or hospital pharmacy. Its scope encompasses:
1. **Clinical Inventory Control:** Batch-wise tracking, dosage forms (tablets, syrups, drops, ointments), manufacturer details, and shelf/rack positioning.
2. **Retail Counter Billing:** Real-time stock decrement upon sale, multi-item invoicing, doctor details for prescription drugs, and discount deductions.
3. **Audit & Compliance:** Complete audit trail of invoices, refund/cancellation handling with automatic stock replenishment, and drug license number archiving.
4. **Cloud Database Architecture:** Fully integrated with MongoDB Atlas for distributed, scalable document persistence.

---

## 4. Implemented System Modules

### Module 1: User Authentication & Role-Based Authorization (RBAC)
- Secure JWT (JSON Web Token) authentication with bcrypt password hashing.
- Role management & User Provisioning:
  - **Admin:** Complete access to all modules, User Management (add/activate/deactivate staff with roles), full medicine inventory CRUD, delete records, cancel/refund invoices, view financial audit reports.
  - **Pharmacist:** Clinical & stock management (add & edit medicines, inward stock purchases, register suppliers, POS billing). Cannot delete medicines or manage users.
  - **Cashier:** Front-desk billing counter access (POS billing, view inventory stock & shelf locations, reprint receipts). Restricted from adding/editing/deleting medicines or suppliers.
- **Admin User Management Panel:** Dedicated UI to create new staff users, assign roles, toggle account statuses (active/inactive), and delete staff accounts.

### Module 2: Medicine & Inventory Management
- Full CRUD operations with auto-generated unique SKU barcodes (`MED-XXXXX`).
- Classification by therapeutic category (Antibiotics, Analgesics, Antacids, Diabetes Care, etc.).
- Real-time stock badges:
  - 🟢 **In Stock:** Sufficient inventory above threshold.
  - 🟠 **Low Stock:** Quantity below minimum alert threshold.
  - 🟡 **Expiring Soon:** Valid batch expiring within 30 days.
  - 🔴 **Expired:** Date exceeded current timestamp (dispensing blocked).
- Physical storage rack identification (e.g., `Rack A-01`, `Shelf S-04`).
- CSV export for regulatory auditing.

### Module 3: Point of Sale (POS) & Billing Counter
- Split-screen UI: Interactive drug catalog on left, live shopping cart on right.
- Real-time stock availability validation (prevents selling more than on-hand stock).
- Support for customer details, prescribing physician, discount allowances, and GST rates.
- Multi-mode payment recording: Cash, UPI / QR, Credit Card, and Customer Credit.
- Automatic inventory decrement on order completion.
- Interactive **1-Click Download PDF & Printable Retail Tax Invoice / Cash Receipt** formatted to pharmacy dispensary standards (`html2pdf.js` vector generation).

### Module 4: Supplier & Procurement Management
- Directory of licensed drug distributors (Sun Pharma, Cipla, Abbott, Mankind, etc.) with GSTIN and Drug License numbers.
- Purchase order generation that updates batch numbers, expiry dates, purchase costs, and increments stock quantities in inventory upon delivery receipt.

### Module 5: Sales Records & Invoices History
- Searchable invoice archive filtered by date intervals (Today, 7 Days, Month, All Time) and payment methods.
- Detailed receipt view with full breakdown of dispensed medications.
- 1-Click invoice cancellation and return mechanism that safely restores units back to physical inventory.

### Module 6: Executive Analytics & Valuation Reports
- Real-time KPI summaries (Today's Revenue, Active Invoices, Stock Retail Value, Capital Invested).
- 7-day revenue trend bar chart.
- Top fast-moving medications list.
- Therapeutic category distribution breakdown.
- Financial audit report computing gross retail profit margins and expiry risk valuations.

---

## 5. Software & Hardware Specifications

### Software Requirements:
- **Operating System:** Windows 10 / Windows 11
- **Runtime Environment:** Node.js v20+ / v24+
- **Frontend Framework:** React 18 with Vite build tool
- **Styling:** Tailwind CSS with Plus Jakarta Sans & JetBrains Mono typography
- **Iconography:** Lucide React
- **Backend Framework:** Express.js 4 on Node.js
- **Database:** MongoDB Atlas (Cloud NoSQL Database) / Mongoose ODM
- **Development Tool:** Visual Studio Code with official MongoDB Extension

### Hardware Requirements:
- **Processor:** Intel Core i3 / i5 / AMD Ryzen 5 or higher
- **RAM:** 4 GB minimum (8 GB recommended)
- **Disk Storage:** 500 MB free hard disk space
- **Network:** Internet connection for MongoDB Atlas cloud sync

---

## 6. Technology Stack Architecture

```
+-------------------------------------------------------------+
|                      CLIENT TIER                            |
|  React 18  *  Vite  *  Tailwind CSS  *  Axios  *  Lucide    |
+-------------------------------------------------------------+
                              |
                     RESTful API (JSON)
                              |
+-------------------------------------------------------------+
|                     APPLICATION TIER                        |
|   Node.js  *  Express.js  *  JWT Auth  *  Bcrypt Password   |
+-------------------------------------------------------------+
                              |
                     Mongoose ODM Driver
                              |
+-------------------------------------------------------------+
|                      DATABASE TIER                          |
|         MongoDB Atlas Cluster (Cloud Replica Set)           |
| Collections: users, medicines, suppliers, purchases, sales  |
+-------------------------------------------------------------+
```

---

## 7. Viva & Oral Exam Q&A Reference

### Q1: Why was MongoDB chosen over a relational SQL database?
**Answer:** Pharmacy inventories deal with heterogeneous formulations (e.g., tablets have strip counts and strength, syrups have volumes and storage temperatures, injections have vial doses). MongoDB’s flexible BSON document model allows storing batch details, embedded invoice items, and varied attributes without complex relational join overhead.

### Q2: How does the system prevent overselling or dispensing expired drugs?
**Answer:** The POS controller validates current `stockQuantity` against requested quantity and rejects transactions that exceed stock. In addition, virtual status computes whether `expiryDate < now()`, flagging expired batches and preventing them from being added to patient bills.

### Q3: How does the system handle transaction reversals/refunds?
**Answer:** When an invoice is cancelled via the Sales History module, the backend executes an atomic `$inc` operation on the `Medicine` collection, replenishing the exact quantities back into stock while marking the invoice `cancelled`.

---

**Student's Signature:** ___________________________  
**Guide's Signature:** ___________________________
