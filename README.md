# 🏥 PharmaCare Pro - Advanced Pharmacy Management & POS System

A modern, full-stack Pharmacy Management and Point of Sale (POS) system built using **React, Node.js, Express.js, and MongoDB Atlas**.

Designed specifically for academic submission and commercial deployment in community pharmacies and hospital dispensaries.

Developed according to the **University of Mumbai - T.Y. B.Sc. Computer Science (NEP 2020)** syllabus format.
- **Student Name:** Ritika Sharma (Roll No: 23)
- **Project Guide:** Prof. Jayshree Patade
- **Academic Year:** 2026-2027

---

## ✨ Key Features

1. **Dashboard & Operations Console:**
   - Real-time KPIs: Today's Revenue, Active Invoices, Stock Valuation, Low Stock Alerts, Expiry Warnings.
   - Interactive 7-Day Revenue Trend Bar Chart.
   - Fast-Moving Medicines Leaderboard.
   - Therapeutic Category Distribution.

2. **Role-Based Access Control (RBAC) & User Management (Admin Only):**
   - Admin Panel with dedicated **User Management** section.
   - Create new staff user accounts with assigned roles (`Admin`, `Pharmacist`, `Cashier`).
   - Activate / Deactivate staff accounts and remove users.
   - Strict server & client enforcement:
     - **Admin:** Full administrative control over all resources.
     - **Pharmacist:** Inventory management, stock purchases intake, supplier records, and POS billing.
     - **Cashier:** POS counter billing and read-only inventory lookup. **Strictly restricted from adding/editing/deleting medicines or suppliers!**

3. **Medicine & Inventory Management:**
   - Search by Brand Name, Chemical Molecule, SKU barcode, or Batch Number.
   - Filter by therapeutic category and stock status (In Stock, Low Stock, Expiring Soon, Expired).
   - Physical rack/shelf location tracking (e.g. `Rack A-01`, `Shelf S-04`).
   - Add/Edit medicine with buying price and MRP selling price (Cashier is read-only).
   - Export full inventory data to CSV.

4. **Point of Sale (POS) & Automated PDF Billing:**
   - Split-screen cashier interface with real-time stock checks to prevent overselling.
   - Customer details, mobile number, prescribing physician, flat discount, and GST calculation.
   - Multi-mode payment recording (Cash, UPI / QR, Card, Credit).
   - **1-Click Automatic PDF Download:** Instantly converts retail tax invoices into sharp, professional PDFs (`Tax-Invoice-PHARM-XXXX.pdf`) and downloads them to your computer!
   - Direct physical printing option supported (`window.print()`).

5. **Suppliers & Procurement:**
   - Directory of licensed pharmaceutical suppliers (Sun Pharma, Cipla, Abbott, Mankind).
   - Inward stock delivery intake that automatically increments inventory quantities.

6. **Sales & Invoice Archives:**
   - Historical invoice search with date filters.
   - Invoice cancellation & refund mechanism with automatic stock restoration (restricted to Admin/Pharmacist).

7. **Audit & Analytics Reports with PDF Export:**
   - Financial audit report computing capital invested, retail value, and gross markup margins.
   - Quality assurance and drug expiry risk surveillance.
   - **1-Click Automatic PDF Download:** Generates and downloads official **Audit & Valuation Statements** (`.pdf`).

---

## 🚀 Quick Start Guide

> 📖 **Full Step-by-Step GitHub Setup Guide:** See **[`INSTALLATION_GUIDE.md`](./INSTALLATION_GUIDE.md)** for a complete walkthrough on cloning, installing dependencies, pre-configured `.env` setup, and running the project from scratch!  
> 📦 **Requirements & Dependencies:** See **[`requirement.txt`](./requirement.txt)** for exact package versions and technical specifications.

### Option 1: 1-Click Launch (Windows)
Double-click `start-app.bat` in the root folder.
It will automatically launch:
1. Backend server on `http://localhost:5000`
2. Frontend client on `http://localhost:3000`
3. Opens your default web browser automatically!

### Option 2: Manual Terminal Commands

#### 1. Start Backend:
```bash
cd backend
npm run dev
```
Backend API will start at: `http://localhost:5000`

#### 2. Start Frontend:
```bash
cd frontend
npm run dev
```
Frontend UI will start at: `http://localhost:3000`

---

## 🔑 Demo Login Accounts

| Role | Email | Password | Access Level |
| :--- | :--- | :--- | :--- |
| **Admin** | `admin@pharmacy.com` | `admin123` | Full administrative control |
| **Pharmacist** | `pharmacist@pharmacy.com` | `pharma123` | Inventory, stock intake, sales |
| **Cashier** | `cashier@pharmacy.com` | `cash123` | POS billing counter & receipts |

> *Note: You can click the 1-Click quick fill buttons on the login screen to sign in instantly.*

---

## 🍃 MongoDB Atlas & VS Code Connection

Your MongoDB Atlas cluster credentials are configured in `backend/.env`:
```text
mongodb+srv://koinayaar28_db_user:9tdH1f8CkldI0lqp@cluster0.s7qzc57.mongodb.net/pharmacy_db?retryWrites=true&w=majority
```

- **Detailed VS Code Setup Guide:** See [`VS_CODE_MONGODB_GUIDE.md`](./VS_CODE_MONGODB_GUIDE.md) for instructions on connecting with the VS Code MongoDB Extension, whitelisting your IP (`0.0.0.0/0`), and running query playgrounds!
- **Academic Project Documentation:** See [`PROJECT_SYNOPSIS_REPORT.md`](./PROJECT_SYNOPSIS_REPORT.md) for the complete academic report format matching the University of Mumbai NEP 2020 submission requirements.
