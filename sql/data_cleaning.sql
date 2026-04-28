Select * from healthcare_data;

-- Remove null values
DELETE FROM healthcare_data
WHERE patient_id IS NULL;

-- Standardize department names
UPDATE healthcare_data
SET department = TRIM(UPPER(department));

-- Handle missing wait_time
UPDATE healthcare_data
SET wait_time = 0
WHERE wait_time IS NULL;

-- Remove duplicates
DELETE FROM healthcare_data
WHERE patient_id IN (
    SELECT patient_id
    FROM (
        SELECT patient_id,
               ROW_NUMBER() OVER (PARTITION BY patient_id ORDER BY visit_date) AS rn
        FROM healthcare_data
    ) t
    WHERE rn > 1
);

