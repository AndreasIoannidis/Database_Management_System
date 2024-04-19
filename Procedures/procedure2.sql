DELIMITER //

CREATE PROCEDURE JobManagement(
    IN employee_username VARCHAR(30),
    IN job_id INT,
    IN action CHAR(1)
)
BEGIN
    DECLARE current_status VARCHAR(10);
    DECLARE evaluator_count INT;

    
    SELECT status
    INTO current_status
    FROM applies
    WHERE cand_usrname = employee_username AND job_id = job_id;

    
    CASE action
        WHEN 'i' THEN
            
            IF current_status IS NULL THEN
               
                SELECT COUNT(*)
                INTO evaluator_count
                FROM evaluator
                WHERE firm = (SELECT firm FROM employee WHERE username = employee_username);

                IF evaluator_count < 2 THEN
                    
                    INSERT INTO evaluator (username, exp_years, firm)
                    SELECT u.username, 5, e.firm
                    FROM user u
                    CROSS JOIN employee e
                    WHERE e.firm = (SELECT firm FROM employee WHERE username = employee_username)
                        AND u.username NOT IN (SELECT username FROM evaluator WHERE firm = e.firm)
                        
                    LIMIT 2;
                END IF;

                
                INSERT INTO applies (cand_usrname, job_id, status, application_date)
                VALUES (employee_username, job_id, 'active', NOW());
                SELECT 'Job application inserted successfully.' AS result;
            ELSE
                SELECT 'Job application already exists.' AS result;
            END IF;

        WHEN 'c' THEN
            
            IF current_status = 'active' THEN
                UPDATE applies
                SET status = 'canceled'
                WHERE cand_usrname = employee_username AND job_id = job_id;
                SELECT 'Job application canceled successfully.' AS result;
            ELSE
                SELECT 'Cannot cancel. Job application is not active.' AS result;
            END IF;

        WHEN 'a' THEN
            
            IF current_status = 'canceled' THEN
                UPDATE applies
                SET status = 'active'
                WHERE cand_usrname = employee_username AND job_id = job_id;
                SELECT 'Canceled job application activated successfully.' AS result;
            ELSE
                SELECT 'Cannot activate. Job application is not canceled.' AS result;
            END IF;

        ELSE
            SELECT 'Invalid action. Use "i" for insert, "c" for cancel, or "a" for activate.' AS result;
    END CASE;
END //

DELIMITER ;
