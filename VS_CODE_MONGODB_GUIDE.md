# 🍃 Connecting MongoDB Atlas with VS Code MongoDB Extension

This guide provides step-by-step instructions to connect, query, and manage your **MongoDB Atlas Cloud Cluster** directly from within **Visual Studio Code (VS Code)** using the official **MongoDB for VS Code** extension.

---

## 📌 1. Your Credentials & Connection String

- **Cluster Host:** `cluster0.s7qzc57.mongodb.net`
- **Username:** `koinayaar28_db_user`
- **Password:** `9tdH1f8CkldI0lqp`
- **Database Name:** `pharmacy_db`

### Complete MongoDB Connection String:
```text
mongodb+srv://koinayaar28_db_user:9tdH1f8CkldI0lqp@cluster0.s7qzc57.mongodb.net/pharmacy_db?retryWrites=true&w=majority
```

---

## ⚠️ 2. Crucial Prerequisite: Whitelist IP Address in MongoDB Atlas

If your cluster rejects the connection with `MongooseServerSelectionError` or connection timeout, it means your current network IP is not in the Atlas access list.

### Quick Steps to Allow Access:
1. Log in to [MongoDB Atlas Console](https://cloud.mongodb.com/).
2. In the left-hand sidebar under **Security**, click **Network Access**.
3. Click the green button **+ Add IP Address**.
4. Choose **Allow Access from Anywhere** (which automatically enters `0.0.0.0/0`).
   > *Note: For college labs, home Wi-Fi, and presentations, `0.0.0.0/0` ensures you can connect without IP restrictions.*
5. Click **Confirm**. Wait ~30 seconds for the status to show **Active**.

---

## 🔌 3. Installing MongoDB Extension in VS Code

1. Open **VS Code**.
2. Press `Ctrl + Shift + X` (or click the Extensions icon in the left Activity Bar).
3. In the search box, type:
   ```text
   MongoDB for VS Code
   ```
4. Click **Install** on the official extension by **MongoDB** (Identifier: `mongodb.mongodb-vscode`).

---

## 🔗 4. Connecting to the Database in VS Code

1. Click on the **MongoDB Leaf Icon (🍃)** in the left VS Code Activity Bar.
2. Under **CONNECTIONS**, click **+ (Add Connection)** or click **Connect with Connection String**.
3. A prompt box will appear at the top center of VS Code.
4. Paste the connection string:
   ```text
   mongodb+srv://koinayaar28_db_user:9tdH1f8CkldI0lqp@cluster0.s7qzc57.mongodb.net/pharmacy_db?retryWrites=true&w=majority
   ```
5. Press **Enter**.
6. VS Code will establish a secure TLS connection to `cluster0.s7qzc57.mongodb.net`.
7. Once connected, you will see your cluster listed under **CONNECTIONS**:
   ```
   ▼ cluster0.s7qzc57.mongodb.net
     ▼ pharmacy_db
       ► medicines
       ► sales
       ► suppliers
       ► purchases
       ► users
   ```

---

## 📂 5. Exploring Collections & Documents

1. Expand `pharmacy_db` under the connection tree.
2. Click on any collection (e.g., `medicines`).
3. Click on individual documents to view their JSON fields, such as:
   - `name`, `genericName`, `sku`, `batchNumber`, `rackLocation`, `expiryDate`, `stockQuantity`, `sellingPrice`.
4. Right-click on a document to **Edit Document**, **Clone Document**, or **Delete Document**.

---

## 📝 6. Running MongoDB Playgrounds in VS Code

MongoDB Playgrounds let you run JavaScript queries and aggregations directly in VS Code:

1. Click the **Create Playground** icon (page with a plus) next to `pharmacy_db` or press `Ctrl + Shift + P` and select `MongoDB: Create MongoDB Playground`.
2. Replace the template with any of the following queries:

### Query A: Find All Low Stock Medicines (< 15 units)
```javascript
use('pharmacy_db');

db.medicines.find(
  { stockQuantity: { $lte: 15 } },
  { name: 1, batchNumber: 1, stockQuantity: 1, rackLocation: 1 }
);
```

### Query B: Calculate Today's Total Sales Revenue
```javascript
use('pharmacy_db');

db.sales.aggregate([
  { $match: { paymentStatus: 'completed' } },
  { $group: { _id: null, totalRevenue: { $sum: '$grandTotal' }, count: { $sum: 1 } } }
]);
```

### Query C: Find Expired or Near-Expiry Formulations
```javascript
use('pharmacy_db');

const thirtyDaysLater = new Date(Date.now() + 30 * 24 * 60 * 60 * 1000);

db.medicines.find(
  { expiryDate: { $lte: thirtyDaysLater } },
  { name: 1, batchNumber: 1, expiryDate: 1, rackLocation: 1 }
);
```

3. Click the **▶ Play button (Run)** at the top right of the editor or press `Ctrl + Alt + S`.
4. The output pane will open on the right displaying formatted JSON results from your MongoDB Atlas cloud database.

---

## 🚀 7. Seeding Data Into MongoDB Atlas

Once your IP is whitelisted in Atlas, run:
```bash
cd "C:\Users\farde\Desktop\Pharmacy Management System\backend"
npm run seed
```
Or double-click `seed-database.bat` in the project root folder.
This will instantly populate `medicines`, `suppliers`, `purchases`, `sales`, and `users` into your Atlas database!
