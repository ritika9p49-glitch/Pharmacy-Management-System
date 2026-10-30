# 📖 GitHub Installation & Setup Guide
## PharmaCare Pro — Pharmacy Management & POS System
**University of Mumbai — T.Y. B.Sc. Computer Science (NEP 2020)**  
**Student:** Ritika Sharma (Roll No: 23) | **Guide:** Prof. Jayshree Patade

---

> [!NOTE]
> **Zero Configuration Required for `.env`:**  
> The `.env` file is **already included** inside the repository (`backend/.env`) pre-configured with the live MongoDB Atlas cloud cluster credentials. You **do not** need to manually create or configure environment variables to run this project!

---

## 📋 System Prerequisites

Before starting, make sure your computer has the following installed:

1. **Node.js (v18.x, v20.x, or v24.x LTS):**
   - Download: [https://nodejs.org/](https://nodejs.org/)
   - Verify in your terminal:
     ```bash
     node -v
     npm -v
     ```
2. **Git (Optional, for cloning):**
   - Download: [https://git-scm.com/](https://git-scm.com/)
3. **Web Browser:** Google Chrome, Edge, Firefox, or Brave.
4. **Code Editor:** [Visual Studio Code](https://code.visualstudio.com/) (Recommended).

---

## 🚀 Step-by-Step Installation Plan

```
GitHub Repository
       │
       ├──► 1. Clone or Download ZIP
       ├──► 2. Backend Setup: npm install
       ├──► 3. Frontend Setup: npm install
       ├──► 4. Seed Database: npm run seed
       └──► 5. Launch Application: start-app.bat or npm run dev
```

---

### Step 1: Clone or Download the Project from GitHub

#### Option A: Using Git Clone (Recommended)
Open your terminal (Command Prompt, PowerShell, or Git Bash) and run:
```bash
git clone https://github.com/<your-username>/Pharmacy-Management-System.git
cd "Pharmacy-Management-System"
```

#### Option B: Download as ZIP
1. On the GitHub repository page, click the green **Code** button.
2. Select **Download ZIP**.
3. Extract the ZIP folder to your desired location (e.g., Desktop or Documents).
4. Open the extracted folder in VS Code or Terminal.

---

### Step 2: Verify the Included `.env` File

Open `backend/.env`. It is already pre-configured with the live MongoDB Atlas connection:
```env
PORT=5000
MONGODB_URI=mongodb+srv://koinayaar28_db_user:9tdH1f8CkldI0lqp@cluster0.s7qzc57.mongodb.net/pharmacy_db?retryWrites=true&w=majority
JWT_SECRET=pharmacy_management_secret_key_2026_ritika_mumbai_univ
NODE_ENV=development
```
*(No edits required! Everything connects automatically).*

---

### Step 3: Install Dependencies

The project consists of two parts: **Backend (Express API)** and **Frontend (React + Vite)**.

#### 1. Install Backend Dependencies:
Open terminal in the project root and run:
```bash
cd backend
npm install
cd ..
```

#### 2. Install Frontend Dependencies:
```bash
cd frontend
npm install
cd ..
```

> [!TIP]
> **Root Shortcut:** You can also run `npm --prefix backend install` and `npm --prefix frontend install` directly from the root folder!

---

### Step 4: Seed the Database with Realistic Demo Data

Populate the database with authentic medicines, suppliers, batches, purchase orders, sales transactions, and demo staff accounts:

```bash
cd backend
npm run seed
cd ..
```
*Or on Windows, simply double-click [`seed-database.bat`](./seed-database.bat).*

You will see:
```text
🎉 Seed Data Inserted Successfully into MongoDB Atlas!
👨‍⚕️ Users: 3 (Admin, Pharmacist, Cashier)
💊 Medicines: 12 items with inventory stock
🏢 Suppliers: 4 pharmaceutical distributors
📦 Purchases: 2 stock deliveries recorded
🧾 Sales: 5 POS invoices generated with analytics
```

---

### Step 5: Launch the Application

#### 🖱️ Option A: 1-Click Launch on Windows (Easiest)
Simply double-click the **[`start-app.bat`](./start-app.bat)** file in the root folder.
- It will automatically launch the **Backend Server** (Port 5000).
- It will automatically launch the **Frontend React App** (Port 3000).
- It will open your web browser to `http://localhost:3000`.

---

#### 💻 Option B: Manual Launch (Windows, macOS, Linux)

Open two separate terminal windows:

**Terminal 1 (Backend Server):**
```bash
cd backend
npm run dev
```
*Backend runs on:* `http://localhost:5000`

**Terminal 2 (Frontend Client):**
```bash
cd frontend
npm run dev
```
*Frontend runs on:* `http://localhost:3000`

Open your browser and navigate to:  
👉 **`http://localhost:3000`**

---

## 🔑 Step 6: Logging In with Pre-Configured Accounts

The login screen includes **1-Click Autofill Buttons** for instant access:

| Role | Email Address | Password | Permissions & Features |
| :--- | :--- | :--- | :--- |
| **👑 Admin** | `admin@pharmacy.com` | `admin123` | **Full Access:** User Management, Add/Edit/Delete Medicines & Suppliers, Invoices, Stock Intake, Valuation Reports |
| **👨‍⚕️ Pharmacist** | `pharmacist@pharmacy.com` | `pharma123` | **Clinical Control:** Add & Edit Medicines, Stock Intake, Register Suppliers, POS Billing, View Sales |
| **💳 Cashier** | `cashier@pharmacy.com` | `cash123` | **Billing Counter:** POS Billing, Read-Only Inventory Lookup, View & Reprint Receipts (Restricted from adding/editing medicines or suppliers) |

---

## 🌐 Step 7: MongoDB Atlas Network IP Whitelist Note

If you clone this repository onto a new computer or different Wi-Fi network and see a connection message:
1. Log in to [MongoDB Atlas Console](https://cloud.mongodb.com/).
2. In the left menu under **Security**, click **Network Access**.
3. Click **+ Add IP Address** $\rightarrow$ Click **Allow Access from Anywhere (`0.0.0.0/0`)** $\rightarrow$ Click **Confirm**.

> [!NOTE]
> **Built-in In-Memory Fallback:** Even if internet is disconnected or Atlas IP is blocked, PharmaCare Pro's **In-Memory Fallback Engine** automatically keeps all features (POS billing, receipts, inventory, PDF downloads) 100% operational with zero downtime!

---

## 🍃 Step 8: (Optional) Connect via VS Code MongoDB Extension

To browse your collections and documents directly in VS Code:
1. In VS Code, install the extension **MongoDB for VS Code** (`mongodb.mongodb-vscode`).
2. Click the **MongoDB Leaf Icon (🍃)** on the left Activity Bar.
3. Click **Connect with Connection String**.
4. Paste:
   ```text
   mongodb+srv://koinayaar28_db_user:9tdH1f8CkldI0lqp@cluster0.s7qzc57.mongodb.net/pharmacy_db?retryWrites=true&w=majority
   ```
5. Press **Enter**. You can now view, query, and edit documents in collections (`users`, `medicines`, `suppliers`, `purchases`, `sales`) right from VS Code!
*(For detailed queries, see [`VS_CODE_MONGODB_GUIDE.md`](./VS_CODE_MONGODB_GUIDE.md)).*

---

## ❓ Troubleshooting & FAQs

### Q1: Port 5000 or Port 3000 is already in use
**Solution:** Another process is using that port.
- On Windows: Run `netstat -ano | findstr :5000` to find the process ID and `taskkill /PID <PID> /F` to stop it.
- Or change the port in `backend/.env` (e.g. `PORT=5001`) and update `frontend/vite.config.js` proxy.

### Q2: How do I generate PDF invoices?
**Solution:** In the POS Billing screen or Sales History, click **View / Print** on any invoice $\rightarrow$ Click the green **Download PDF Receipt** button. The system will convert and download the formatted PDF to your `Downloads` folder!

### Q3: How do I add more users with different roles?
**Solution:** Log in as **Admin** (`admin@pharmacy.com`) $\rightarrow$ Click **User Management** in the sidebar $\rightarrow$ Click **Add New Staff User** $\rightarrow$ Fill name, email, password, and select role (`Admin`, `Pharmacist`, `Cashier`).

---

## 📁 Project Directory Structure Reference

```
Pharmacy Management System/
├── backend/
│   ├── config/
│   │   ├── db.js                # MongoDB Atlas connection & fallback
│   │   └── inMemoryStore.js     # Zero-downtime offline data engine
│   ├── controllers/            # Auth, Medicine, Supplier, Purchase, Sale, Dashboard
│   ├── middleware/             # JWT auth & RBAC authorization
│   ├── models/                 # Mongoose schemas (User, Medicine, Supplier, Purchase, Sale)
│   ├── routes/                 # Express REST endpoints
│   ├── seeds/
│   │   └── seed.js             # Initial database seed script
│   ├── .env                    # Pre-configured Atlas cloud credentials
│   ├── package.json
│   └── server.js
├── frontend/
│   ├── src/
│   │   ├── components/         # Navbar, Sidebar, Modals, Badges, Cards
│   │   ├── context/            # AuthContext (JWT session management)
│   │   ├── pages/              # Dashboard, POSBilling, Inventory, Sales, Suppliers, Purchases, Reports, Users
│   │   ├── App.jsx
│   │   └── main.jsx
│   ├── index.html
│   ├── vite.config.js
│   ├── tailwind.config.js
│   └── package.json
├── INSTALLATION_GUIDE.md       # Complete GitHub step-by-step setup guide
├── PROJECT_SYNOPSIS_REPORT.md  # University of Mumbai academic documentation (NEP 2020)
├── VS_CODE_MONGODB_GUIDE.md    # VS Code MongoDB extension tutorial
├── requirement.txt             # Dependencies and technical specifications
├── requirements.txt            # Duplicate reference file
├── README.md                   # Project overview & features
├── start-app.bat               # 1-Click Windows execution launcher
└── seed-database.bat           # 1-Click Database seed launcher
```

---
**Academic Project Reference:**  
University of Mumbai — T.Y. B.Sc. Computer Science (NEP 2020)  
Student: Ritika Sharma (Roll No: 23) | Guide: Prof. Jayshree Patade
