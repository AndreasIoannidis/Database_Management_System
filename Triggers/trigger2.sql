DELIMITER //

CREATE TRIGGER Before_Insert_Apply
BEFORE INSERT ON applies
FOR EACH ROW
BEGIN
    DECLARE total_active_applications INT;

    -- Έλεγχος αν έχει περάσει λιγότερο από 15 μέρες από την ημερομηνία έναρξης
    IF NEW.application_date < (SELECT DATE_ADD(start_date_, INTERVAL 15 DAY) FROM job WHERE id = NEW.job_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot apply for the job. Submission date is less than 15 days from start date.';
    END IF;

    -- Έλεγχος αν ο εργαζόμενος έχει ήδη τρεις ενεργές αιτήσεις
    SELECT COUNT(job_id)
    INTO total_active_applications
    FROM applies
    WHERE cand_usrname = NEW.cand_usrname
        AND status = 'Active';

    IF total_active_applications >= 3 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot apply for the job. Employee already has three active applications.';
    END IF;
END;

//

DELIMITER ;

