-- Creates script crearing a stored procedures
-- Prcedures(Addbonus), does correction for a studdents
DELIMITER //
CREATE PROCEDURE AddBonus(
	IN user_id INT,
	IN project_name VARCHAR(255), 
	IN score INT
)
BEGIN
  DECLARE project_id INT;
  DECLARE user_exists INT;

  -- Check if the user exists
  SELECT COUNT(*) INTO user_exists FROM users WHERE id = user_id;
  IF user_exists = 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User does not exist';
  END IF;

  -- Check if the project exists
  SELECT id INTO project_id FROM projects WHERE name = project_name LIMIT 1;
  IF project_id IS NULL THEN
    INSERT INTO projects (name) VALUES (project_name);
    SET project_id = LAST_INSERT_ID();
  END IF;

  -- Insert the correction
  INSERT INTO corrections (user_id, project_id, score) VALUES (user_id, project_id, score);
END /
DELIMITER ;

