-- Total patients
SELECT COUNT(DISTINCT patient_id) AS total_patients
FROM healthcare_data;

-- Average wait time
SELECT AVG(wait_time) AS avg_wait_time
FROM healthcare_data;

-- Revenue by department
SELECT department, SUM(treatment_cost) AS revenue
FROM healthcare_data
GROUP BY department
ORDER BY revenue DESC;

-- Cancellation rate
SELECT 
    COUNT(CASE WHEN visit_status = 'Cancelled' THEN 1 END) * 100.0 
    / COUNT(*) AS cancellation_rate
FROM healthcare_data;

-- Daily patient trend
SELECT visit_date, COUNT(*) AS patient_count
FROM healthcare_data
GROUP BY visit_date
ORDER BY visit_date;