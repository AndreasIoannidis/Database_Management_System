DELIMITER //
CREATE TRIGGER prevent_cancellation
BEFORE UPDATE ON applies
FOR EACH ROW
BEGIN
    DECLARE start_date_ DATE;
    DECLARE total_active_applications INT;

   
    IF NEW.status = 'Cancelled' THEN
       
        SELECT start_date_ INTO start_date_
        FROM job
        WHERE job.id = NEW.job_id;

    -- Έλεγχος αν έχει περάσει λιγότερο από 10 μέρες από την ημερομηνία έναρξης
        IF NEW.application_date < (SELECT DATE_ADD(start_date_, INTERVAL 10 DAY) FROM job WHERE id = NEW.job_id) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Cannot apply for the job. Submission date is less than 10 days from start date.';
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
    END IF;
END;

//

DELIMITER ;