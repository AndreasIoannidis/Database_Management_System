-- Προσθήκη κολόνας status στον πίνακα applies
ALTER TABLE applies
ADD COLUMN status ENUM('Active', 'Completed', 'Cancelled') DEFAULT 'active';

ALTER TABLE applies
ADD COLUMN application_date DATE NOT NULL;


UPDATE applies
SET status = 'Active'
WHERE cand_usrname IN ('giorgos', 'manos') AND status = 'Canceled';



-- Δημιουργία τριγκέρ για τον πίνακα job
DELIMITER //
CREATE TRIGGER job_log_insert_trigger AFTER INSERT ON job
FOR EACH ROW
BEGIN
    INSERT INTO log (action_type, username, action_timestamp)
    VALUES ('INSERT', USER(), CURRENT_TIMESTAMP);
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER job_log_update_trigger AFTER UPDATE ON job
FOR EACH ROW
BEGIN
    INSERT INTO log (action_type, username, action_timestamp)
    VALUES ('UPDATE', USER(), CURRENT_TIMESTAMP);
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER job_log_delete_trigger AFTER DELETE ON job
FOR EACH ROW
BEGIN
    INSERT INTO log (action_type, username, action_timestamp)
    VALUES ('DELETE', USER(), CURRENT_TIMESTAMP);
END;
//
DELIMITER ;



DELIMITER //
CREATE TRIGGER user_log_insert_trigger AFTER INSERT ON user
FOR EACH ROW
BEGIN
    INSERT INTO log (action_type, username, action_timestamp)
    VALUES ('INSERT', USER(), CURRENT_TIMESTAMP);
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER user_log_update_trigger AFTER UPDATE ON user
FOR EACH ROW
BEGIN
    INSERT INTO log (action_type, username, action_timestamp)
    VALUES ('UPDATE', USER(), CURRENT_TIMESTAMP);
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER user_log_delete_trigger AFTER DELETE ON user
FOR EACH ROW
BEGIN
    INSERT INTO log (action_type, username, action_timestamp)
    VALUES ('DELETE', USER(), CURRENT_TIMESTAMP);
END;
//
DELIMITER ;


DELIMITER //
CREATE TRIGGER degree_log_insert_trigger AFTER INSERT ON degree
FOR EACH ROW
BEGIN
    INSERT INTO log (action_type, username, action_timestamp)
    VALUES ('INSERT', USER(), CURRENT_TIMESTAMP);
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER degree_log_update_trigger AFTER UPDATE ON degree
FOR EACH ROW
BEGIN
    INSERT INTO log (action_type, username, action_timestamp)
    VALUES ('UPDATE', USER(), CURRENT_TIMESTAMP);
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER degree_log_delete_trigger AFTER DELETE ON degree
FOR EACH ROW
BEGIN
    INSERT INTO log (action_type, username, action_timestamp)
    VALUES ('DELETE', USER(), CURRENT_TIMESTAMP);
END;
//
DELIMITER ;