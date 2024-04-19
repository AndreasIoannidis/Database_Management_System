CREATE TABLE evaluation (
    evaluator VARCHAR(30),
    evaluated_employee VARCHAR(30),
    evaluation_date DATE,
    grade INT,
    job_evaluated INT,
    PRIMARY KEY (evaluator, evaluated_employee, job_evaluated),
    FOREIGN KEY (evaluator) REFERENCES user(username),
    FOREIGN KEY (evaluated_employee) REFERENCES user(username),
    FOREIGN KEY (job_evaluated) REFERENCES job(id)
);

INSERT INTO evaluation (evaluator, evaluated_employee, evaluation_date, grade, job_evaluated)
VALUES 
('ashmenia', 'antonia', '2023-05-15', 18, 1),
('ashmenia', 'giorgos', '2023-06-10', 15, 2),
('gianna', 'manos', '2023-07-20', 12, 5),
('menelaos', 'ourania', '2023-08-05', 19, 6),
('spuros', 'theofilos', '2023-10-30', 16, 4),
('gianna', 'giorgos', '2023-12-08', 13, 2),
('ioanna', 'manos', '2024-01-18', 20, 5),
('spuros', 'antonia', '2023-05-15', 18, 1),
('ioanna', 'theofilos', '2023-10-30', 16, 4),
('spuros', 'ourania', '2024-02-01', 18, 6);
