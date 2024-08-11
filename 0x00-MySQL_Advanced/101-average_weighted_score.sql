-- wiihted average
-- Advanced task

DELIMITER //

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    DECLARE user_id INT;
    DECLARE avg_score FLOAT;

    -- Declare a cursor to iterate through each user
    DECLARE user_cursor CURSOR FOR
        SELECT id FROM users;

    -- Declare exit handler for cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET user_id = NULL;

    -- Open the cursor
    OPEN user_cursor;

    user_loop: LOOP
        -- Fetch the next user ID
        FETCH user_cursor INTO user_id;

        -- If there are no more users, exit the loop
        IF user_id IS NULL THEN
            LEAVE user_loop;
        END IF;

        -- Compute the average weighted score for the current user
        SELECT SUM(c.score * p.weight) / SUM(p.weight) INTO avg_score
        FROM corrections c
        JOIN projects p ON c.project_id = p.id
        WHERE c.user_id = user_id;

        -- Update the user's average score
        UPDATE users SET average_score = avg_score WHERE id = user_id;
    END LOOP;

    -- Close the cursor
    CLOSE user_cursor;

END //

DELIMITER ;

