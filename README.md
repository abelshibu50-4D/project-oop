# 🏫 CampusFix — Smart Campus Issue Management System

> **Hackathon MVP**: A modern, real-time campus facility issue tracking and resolution system connecting **Students**, **Staff Technicians**, and **Campus Administrators**.

---

## 🌟 Key Highlights & Demo Features

1. **👨‍🎓 Student Portal**:
   - Report issues with automatic Smart AI suggestions for Category and Priority.
   - Attach photos or use instant quick-demo image presets.
   - Visual 5-step progress timeline (`Reported` → `Assigned` → `In Progress` → `Resolved` → `Closed`).
   - Rate resolution quality (1–5 Stars) with custom highlight tags and celebration confetti.

2. **👷 Staff & Technician Operations Queue**:
   - Real-time work queues filtered by department (Electrical, Plumbing, IT Support, Housekeeping, Security).
   - Advance issue statuses with detailed technician progress notes and repair proof photos.
   - High-priority and emergency alert banners for urgent hazards.

3. **🏛️ Admin Command Center**:
   - Interactive **Recharts** visualizations (Category distribution bar chart, Lifecycle progress donut chart, Department performance matrix).
   - Global ticket management table with 1-click Department/Staff reassignment.
   - Instant CSV data export for management reporting.

4. **⚡ Smart Auto-Routing & AI Engine**:
   - Contextual NLP engine analyzes user input in real-time to recommend matching department and urgency.
   - Auto-routes new issues to the responsible department head and available technician.

5. **🔔 Real-Time Notifications & Toasts**:
   - Instant in-app notification center and dynamic toast alerts for status transitions.

6. **🚀 1-Click Demo Persona Switcher**:
   - Seamlessly switch between **Alex Carter (Student)**, **Rajesh Kumar (Staff - Electrical)**, and **Dr. Sarah Jenkins (Campus Admin)** directly in the top navigation bar.

---

## 🛠️ Tech Stack

- **Frontend**: React + Vite
- **Styling**: SASS (`.scss`) + Tailwind CSS
- **Backend / Database**: Supabase (`supabase-schema.sql` included) + Local-First Reactive Store
- **Icons**: Lucide React
- **Visualizations**: Recharts
- **Celebration Effects**: Canvas-Confetti

---

## 🚀 Getting Started

### 1. Install Dependencies
```bash
npm install
```

### 2. Run Development Server
```bash
npm run dev
```
Open [http://localhost:5173](http://localhost:5173) in your browser.

### 3. Build for Production
```bash
npm run build
```

---

## 🗄️ Database Setup (Supabase)

A production-ready PostgreSQL migration script is provided in [`supabase-schema.sql`](./supabase-schema.sql).

To deploy on Supabase:
1. Create a project at [supabase.com](https://supabase.com).
2. Go to the SQL Editor and paste the contents of `supabase-schema.sql`.
3. Add your Supabase credentials to `.env`:
   ```env
   VITE_SUPABASE_URL=https://your-project-id.supabase.co
   VITE_SUPABASE_ANON_KEY=your-anon-key
   ```
*(Note: If no Supabase credentials are provided, CampusFix automatically runs in offline-ready Demo Mode with preloaded realistic campus scenarios!)*
