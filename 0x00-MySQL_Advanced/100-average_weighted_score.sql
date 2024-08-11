-- SQL script that creates a stored procedure ComputeAverageWeightedScoreForUser
-- computes and store the average weighted score for a student. 

DELIMITER //

CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN user_id INT)
BEGIN
    DECLARE avg_weighted_score FLOAT DEFAULT 0;

    -- Calculate the weighted average score for the user
    SELECT SUM(c.score * p.weight) / SUM(p.weight) INTO avg_weighted_score
    FROM corrections c
    JOIN projects p ON c.project_id = p.id
    WHERE c.user_id = user_id;

    -- Update the user's average score in the users table
    UPDATE users SET average_score = IFNULL(avg_weighted_score, 0) WHERE id = user_id;
END //
DELIMITER ;
