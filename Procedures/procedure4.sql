CREATE TABLE application_history (
    evaluator1_username VARCHAR(30) NOT NULL,
    evaluator2_username VARCHAR(30) NOT NULL,
    employee_username VARCHAR(30) NOT NULL,
    job_id INT(11) NOT NULL,
    status ENUM('completed') DEFAULT 'completed' NOT NULL,
    grade INT,
    PRIMARY KEY (evaluator1_username, evaluator2_username, employee_username, job_id)
);



DELIMITER //

CREATE PROCEDURE findemployeesindex(IN lower_ INT, IN upper_ INT)
BEGIN
    SELECT employee_username, job_id
    FROM application_history
    WHERE grade BETWEEN lower_ AND upper_;
END //

DELIMITER ;




DELIMITER //

CREATE PROCEDURE findemployeebyevaluator(IN evaluator_username VARCHAR(30))
BEGIN
    SELECT employee_username, job_id
    FROM application_history
    WHERE evaluator1_username = evaluator_username OR evaluator2_username = evaluator_username;
END //

DELIMITER ;
