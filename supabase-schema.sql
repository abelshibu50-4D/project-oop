-- ===================================================================
-- CampusCare – Campus Complaint & Issue Tracking System
-- Relational Database Schema (Supabase / PostgreSQL)
-- ===================================================================
-- Clean, production-ready schema.
-- Flexible VARCHAR primary keys for universal compatibility.
-- No sample students, administrators, staff members, or mock complaints.
-- ===================================================================

-- 1. Enable UUID Extension (if needed)
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- 2. Create Departments Table
CREATE TABLE IF NOT EXISTS departments (
    department_id VARCHAR(100) PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    code VARCHAR(50) UNIQUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 3. Create Users Table
CREATE TABLE IF NOT EXISTS users (
    user_id VARCHAR(100) PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    student_id VARCHAR(50) UNIQUE,
    department_id VARCHAR(100) REFERENCES departments(department_id) ON DELETE SET NULL,
    designation VARCHAR(150),
    password_hash VARCHAR(255) NOT NULL,
    salt VARCHAR(100),
    role VARCHAR(20) NOT NULL CHECK (role IN ('student', 'staff', 'admin')),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 4. Create Complaints Table
CREATE TABLE IF NOT EXISTS complaints (
    complaint_id VARCHAR(100) PRIMARY KEY,
    user_id VARCHAR(100) NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    category VARCHAR(50) NOT NULL CHECK (category IN (
        'Electrical Issues',
        'Classroom Maintenance',
        'Laboratory Issues',
        'Hostel Issues',
        'Water Supply',
        'Cleanliness',
        'Internet and Wi-Fi',
        'Library Issues',
        'Other'
    )),
    location VARCHAR(200) NOT NULL,
    campus_block VARCHAR(100),
    department_id VARCHAR(100) REFERENCES departments(department_id) ON DELETE SET NULL,
    priority VARCHAR(20) NOT NULL CHECK (priority IN ('Low', 'Medium', 'High')),
    image_path TEXT,
    status VARCHAR(30) NOT NULL DEFAULT 'Submitted' CHECK (status IN (
        'Submitted', 'Verified', 'Assigned', 'In Progress', 'Resolved', 'Rejected', 'Closed'
    )),
    rejection_reason TEXT,
    assigned_to VARCHAR(100) REFERENCES users(user_id) ON DELETE SET NULL,
    resolution_notes TEXT,
    resolution_proof_url TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    resolved_at TIMESTAMP WITH TIME ZONE
);

-- 5. Create Assignments Table
CREATE TABLE IF NOT EXISTS assignments (
    assignment_id VARCHAR(100) PRIMARY KEY,
    complaint_id VARCHAR(100) NOT NULL REFERENCES complaints(complaint_id) ON DELETE CASCADE,
    staff_id VARCHAR(100) NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    assigned_date TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    notes TEXT
);

-- 6. Create Feedback Table
CREATE TABLE IF NOT EXISTS feedback (
    feedback_id VARCHAR(100) PRIMARY KEY,
    complaint_id VARCHAR(100) NOT NULL UNIQUE REFERENCES complaints(complaint_id) ON DELETE CASCADE,
    user_id VARCHAR(100) NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 7. Create Notifications Table
CREATE TABLE IF NOT EXISTS notifications (
    notification_id VARCHAR(100) PRIMARY KEY,
    user_id VARCHAR(100) NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    complaint_id VARCHAR(100) REFERENCES complaints(complaint_id) ON DELETE CASCADE,
    title VARCHAR(200),
    message TEXT NOT NULL,
    is_read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 8. Performance Indexes
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
CREATE INDEX IF NOT EXISTS idx_users_student_id ON users(student_id);
CREATE INDEX IF NOT EXISTS idx_users_role ON users(role);
CREATE INDEX IF NOT EXISTS idx_complaints_user ON complaints(user_id);
CREATE INDEX IF NOT EXISTS idx_complaints_status ON complaints(status);
CREATE INDEX IF NOT EXISTS idx_complaints_dept ON complaints(department_id);
CREATE INDEX IF NOT EXISTS idx_complaints_assigned ON complaints(assigned_to);
CREATE INDEX IF NOT EXISTS idx_assignments_complaint ON assignments(complaint_id);
CREATE INDEX IF NOT EXISTS idx_assignments_staff ON assignments(staff_id);
CREATE INDEX IF NOT EXISTS idx_notifications_user ON notifications(user_id);

-- 9. Row Level Security (RLS)
ALTER TABLE departments ENABLE ROW LEVEL SECURITY;
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE complaints ENABLE ROW LEVEL SECURITY;
ALTER TABLE assignments ENABLE ROW LEVEL SECURITY;
ALTER TABLE feedback ENABLE ROW LEVEL SECURITY;
ALTER TABLE notifications ENABLE ROW LEVEL SECURITY;

-- Anonymous/Authenticated Public access policies for application API access
CREATE POLICY "Public Read Departments" ON departments FOR SELECT USING (true);
CREATE POLICY "Public Insert Departments" ON departments FOR INSERT WITH CHECK (true);
CREATE POLICY "Public Update Departments" ON departments FOR UPDATE USING (true);
CREATE POLICY "Public Delete Departments" ON departments FOR DELETE USING (true);

CREATE POLICY "Public Read Users" ON users FOR SELECT USING (true);
CREATE POLICY "Public Insert Users" ON users FOR INSERT WITH CHECK (true);
CREATE POLICY "Public Update Users" ON users FOR UPDATE USING (true);

CREATE POLICY "Public Read Complaints" ON complaints FOR SELECT USING (true);
CREATE POLICY "Public Insert Complaints" ON complaints FOR INSERT WITH CHECK (true);
CREATE POLICY "Public Update Complaints" ON complaints FOR UPDATE USING (true);
CREATE POLICY "Public Delete Complaints" ON complaints FOR DELETE USING (true);

CREATE POLICY "Public Read Assignments" ON assignments FOR SELECT USING (true);
CREATE POLICY "Public Insert Assignments" ON assignments FOR INSERT WITH CHECK (true);
CREATE POLICY "Public Delete Assignments" ON assignments FOR DELETE USING (true);

CREATE POLICY "Public Read Feedback" ON feedback FOR SELECT USING (true);
CREATE POLICY "Public Insert Feedback" ON feedback FOR INSERT WITH CHECK (true);

CREATE POLICY "Public Read Notifications" ON notifications FOR SELECT USING (true);
CREATE POLICY "Public Insert Notifications" ON notifications FOR INSERT WITH CHECK (true);
CREATE POLICY "Public Update Notifications" ON notifications FOR UPDATE USING (true);
