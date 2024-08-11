-- SQL script that creates a stored procedure ComputeAverageWeightedScoreForUser
-- computes and store the average weighted score for a student. 
DELIMITER //

CREATE PROCEDURE AddBonus (
    IN user_id INT,
    IN project_name VARCHAR(255),
    IN score INT
)
BEGIN
    DECLARE project_id INT;

    -- Check if the project already exists
    SELECT id INTO project_id FROM projects WHERE name = project_name;

    IF project_id IS NULL THEN
        -- If not, create a new project
        INSERT INTO projects (name) VALUES (project_name);
        SET project_id = LAST_INSERT_ID();
    END IF;

    -- Insert the correction for the user and project
    INSERT INTO corrections (user_id, project_id, score) VALUES (user_id, project_id, score);
END //

DELIMITER ;
