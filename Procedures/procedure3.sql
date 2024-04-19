DELIMITER //

CREATE PROCEDURE EvaluateApplications(IN job_id_param INT)
BEGIN
    DECLARE highest_average FLOAT;
    DECLARE selected_candidate VARCHAR(30);

    -- Επιλέξτε τον υψηλότερο μέσο όρο αξιολόγησης
    SELECT MAX((evaluator1_grade + evaluator2_grade) / 2) INTO highest_average
    FROM (
        SELECT AVG(grade) AS evaluator1_grade
        FROM evaluation
        WHERE job_evaluated = job_id_param
        GROUP BY evaluated_employee
        ORDER BY evaluator1_grade DESC
        LIMIT 1
    ) AS evaluator1,
    (
        SELECT AVG(grade) AS evaluator2_grade
        FROM evaluation
        WHERE job_evaluated = job_id_param
        GROUP BY evaluated_employee
        ORDER BY evaluator2_grade DESC
        LIMIT 1
    ) AS evaluator2;

    -- Επιλέξτε τον υποψήφιο με τον υψηλότερο μέσο όρο. Σε περίπτωση ισοβαθμίας, επιλέξτε τον πρώτο υποψήφιο που υπέβαλε αίτηση
    SELECT evaluated_employee INTO selected_candidate
    FROM (
        SELECT evaluated_employee, AVG(grade) AS avg_grade
        FROM evaluation
        WHERE job_evaluated = job_id_param
        GROUP BY evaluated_employee
        ORDER BY avg_grade DESC, MIN(evaluation_date) ASC
        LIMIT 1
    ) AS top_candidate;

    -- Ενημέρωση του αντίστοιχου πεδίου στον πίνακα job για τον επιλεγμένο υποψήφιο
    UPDATE job
    SET selected_candidate = selected_candidate
    WHERE id = job_id_param;

END //

DELIMITER ;











