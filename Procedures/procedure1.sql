DELIMITER //

CREATE PROCEDURE CheckEvaluation(
    IN evaluator_username VARCHAR(30),
    IN employee_username VARCHAR(30),
    IN job_id INT,
    OUT result_value INT,
    OUT evaluation_grade FLOAT,
    OUT calculated_grade FLOAT
)
BEGIN
    DECLARE evaluation_exists INT;

    -- Έλεγχος αν υπάρχει βαθμός αξιολόγησης
    SELECT COUNT(*)
    INTO evaluation_exists
    FROM evaluation
    WHERE evaluator = evaluator_username
        AND evaluated_employee = employee_username
        AND job_evaluated = job_id;

    -- Υπολογισμός βαθμού αξιολόγησης αν δεν υπάρχει
    IF evaluation_exists = 0 THEN
        -- Προσθήκη λογικής για υπολογισμό βαθμού αξιολόγησης
        SELECT 
            SUM(CASE WHEN degree.bathmida = 'BSc' THEN 1
                     WHEN degree.bathmida = 'MSc' THEN 2
                     WHEN degree.bathmida = 'PhD' THEN 3
                     ELSE 0 END) +
            IF(languages.lang IS NOT NULL, 1, 0) +
            IF(project.num IS NOT NULL, 1, 0) AS calculated_grade
        INTO calculated_grade
        FROM employee
        LEFT JOIN degree ON employee.username = degree.cand_usrname
        LEFT JOIN languages ON employee.username = languages.candid
        LEFT JOIN project ON employee.username = project.candid
        WHERE employee.username = employee_username;

        SET result_value = 0;
        SET evaluation_grade = NULL;
    ELSE
        -- Αν υπάρχει αξιολόγηση, επιστροφή του βαθμού
        SELECT grade
        INTO evaluation_grade
        FROM evaluation
        WHERE evaluator = evaluator_username
            AND evaluated_employee = employee_username
            AND job_evaluated = job_id;

        SET result_value = 1;
        SET calculated_grade = NULL;
    END IF;
END //

DELIMITER ;
