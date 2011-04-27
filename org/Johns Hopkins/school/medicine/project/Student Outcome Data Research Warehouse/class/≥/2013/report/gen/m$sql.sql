SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[rpt_competency_ge2013_proc] 
--	@start_year int,
--	@end_year int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON

	DELETE FROM [dbo].[rpt_competency_ge2013]
	DELETE FROM [dbo].[rpt_competency_ge2013_tree_map]
	DELETE FROM [dbo].[rpt_competency_ge2013_metric]
	DELETE FROM [dbo].[rpt_competency_ge2013_score]

	--
	-- Generate the tree of metrics
	--

	DECLARE @CurrentID INT
	DECLARE @ParentID INT

	-- Root
 	INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('All Stats')
	SET @ParentID = SCOPE_IDENTITY()

 	INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Core Clerkship Shelf Exam Performance')
	SET @CurrentID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @ParentID, @CurrentID )

 	INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Neurology')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
 	INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Psychiatry')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
 	INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Gynecology/Obstetrics')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
 	INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Surgery')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
 	INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Medicine')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
 	INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Pediatrics')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )

	-- Descend
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Pre-Clinical Course Performance')
	SET @CurrentID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @ParentID, @CurrentID )
	SET @ParentID = @CurrentID

 	INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Scientific Foundations of Medicine')
	SET @CurrentID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @ParentID, @CurrentID )

	-- Leaf
 	INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Macromolecules')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Cell Physiology')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Metabolism')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Genetics')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Pharmacology')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )

	-- Move to sibling
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Genes to Society I')
	SET @CurrentID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @ParentID, @CurrentID )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Immunology I')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Microbiology/Infectious Disease')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Immunology II')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Hematology/Oncology')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Genes to Society II')
	SET @CurrentID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @ParentID, @CurrentID )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Brain, Mind, & Behavior')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Nervous System and Special Senses')
	SET @ParentID = @CurrentID
	SET @CurrentID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @ParentID, @CurrentID )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Neuroanatomy')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('NSS: Exam 2')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Neuroscience')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )

	-- Recurse
	SET @ParentID = ( SELECT competency_id FROM [dbo].[rpt_competency_ge2013_tree_map] WHERE child_id = @ParentID )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Genes to Society III')
	SET @CurrentID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @ParentID, @CurrentID )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Cardiovascular')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Respiratory')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Renal')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Genes to Society IV')
	SET @CurrentID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @ParentID, @CurrentID )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('GI Liver')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Endocrine')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Reproductive')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Musculoskeletal')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )

	SET @ParentID = ( SELECT competency_id FROM [dbo].[rpt_competency_ge2013_tree_map] WHERE child_id = @ParentID )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Comprehensive Basic Science Exam')
	SET @CurrentID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @ParentID, @CurrentID )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Comprehensive Basic Science')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Clinical Skills Performance')
	SET @CurrentID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @ParentID, @CurrentID )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Clinical Foundations of Medicine')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Clerkship Performance')
	SET @CurrentID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (competency_id, child_id) VALUES ( @ParentID, @CurrentID )

	SET @ParentID = @CurrentID

	DECLARE @course_id INT
	DECLARE @title VARCHAR
	DECLARE c CURSOR FOR
		SELECT student_ref_course_id as id, course_master_title as title
			FROM [dbo].[student_ref_course] WHERE course_type = 'core clerkship'
	OPEN c
		FETCH next FROM c INTO @course_id, @title
		WHILE @@Fetch_Status = 0 BEGIN
		    INSERT INTO [dbo].[rpt_competency_ge2013] ( name ) VALUES ( @title )
			SET @CurrentID = SCOPE_IDENTITY()
			INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] ( competency_id, child_id )
				VALUES ( @ParentID, @CurrentID )
			INSERT INTO [dbo].[rpt_competency_ge2013_score] ( competency_id, score, student_id )
				SELECT @CurrentID, grade_equivalent, student_id
					FROM [dbo].[student_course_details] d
					--WHERE course_id = @course_id
					WHERE course_master_title = @title
			FETCH next FROM c INTO @course_id, @title
		END
	CLOSE c
	DEALLOCATE c

	SET @ParentID = ( SELECT competency_id FROM [dbo].[rpt_competency_ge2013_tree_map] WHERE child_id = @ParentID )

	--
	-- Add scores for section leaf nodes
	--

	INSERT INTO [dbo].[rpt_competency_ge2013_score]
		( competency_id, score, student_id )
		SELECT c.id, course_section_grade, student_id
			FROM [dbo].[rpt_competency_ge2013] c
				INNER JOIN [dbo].[student_section_grade] g ON c.name = g.section_title

	--
	-- Add scores for shelf exam leaf nodes
	--

	INSERT INTO [dbo].[rpt_competency_ge2013_score]
		( competency_id, score, student_id )
		SELECT c.id, shlf_exm_std_a_grd / 100.0, student_id
			FROM [dbo].[rpt_competency_ge2013] c
				INNER JOIN [dbo].[student_shlf_exm_a] e ON c.name = e.shlf_exm_dsc

	--
	-- Add scores for clerkship leaf nodes
	--

	INSERT INTO [dbo].[rpt_competency_ge2013_score]
		( competency_id, score, student_id )
		SELECT com.id, grade_equivalent, student_id
			FROM [dbo].[rpt_competency_ge2013] com
				INNER JOIN [dbo].[student_ref_course] c ON com.name = c.course_type
				INNER JOIN [dbo].[student_course_grade] g ON g.student_course_id = c.student_ref_course_id
				INNER JOIN [dbo].[student_ref_grade] r ON g.student_ref_grade_id = r.student_ref_grade_id

	--
	-- Add scores for Clinical Foundations of Medicine leaf nodes
	--

	INSERT INTO [dbo].[rpt_competency_ge2013_score]
		( competency_id, score, student_id )
		SELECT com.id, grade_equivalent, student_id
			FROM [dbo].[rpt_competency_ge2013] com
				INNER JOIN [dbo].[student_ref_course] c ON com.name = c.course_master_title
				INNER JOIN [dbo].[student_course_grade] g ON c.student_ref_course_id = g.student_course_id
				INNER JOIN [dbo].[student_ref_grade] r ON g.student_ref_grade_id = r.student_ref_grade_id
			WHERE course_master_title = 'Clinical Foundations of Medicine'

	--
	-- Calculate metrics for combinations of scores
	--

	DECLARE @CompetencyID INT
	DECLARE @year INT
	DECLARE @avg REAL
	DECLARE @stddev REAL
	DECLARE @count REAL
	DECLARE c CURSOR FOR
		-- Add metrics for leaves
		SELECT competency_id, class_of_desc,
		       AVG(score) AS avg, STDEV(score) as stddev, COUNT(score) as count
			FROM ( (
				SELECT c.id AS competency_id, s.id AS score_id, score, student_id
					FROM [dbo].[rpt_competency_ge2013] c
						INNER JOIN [dbo].[rpt_competency_ge2013_score] s ON c.id = s.competency_id
			) UNION (
				-- First-level parents
				SELECT c.id AS competency_id, s.id AS score_id, score, student_id
					FROM [dbo].[rpt_competency_ge2013] c
						INNER JOIN [dbo].[rpt_competency_ge2013_tree_map] t ON c.id = t.competency_id
						INNER JOIN [dbo].[rpt_competency_ge2013_score] s ON t.child_id = s.competency_id
			) UNION (
				-- Second-level parents
				SELECT c.id AS competency_id, s.id AS score_id, score, student_id
					FROM [dbo].[rpt_competency_ge2013] c
						INNER JOIN [dbo].[rpt_competency_ge2013_tree_map] t1 ON c.id = t1.competency_id
						INNER JOIN [dbo].[rpt_competency_ge2013_tree_map] t2 ON t1.child_id = t2.competency_id
						INNER JOIN [dbo].[rpt_competency_ge2013_score] s ON t2.child_id = s.competency_id
			) UNION (
				SELECT c.id AS competency_id, s.id AS score_id, score, student_id
					FROM [dbo].[rpt_competency_ge2013] c
						INNER JOIN [dbo].[rpt_competency_ge2013_tree_map] t1 ON c.id = t1.competency_id
						INNER JOIN [dbo].[rpt_competency_ge2013_tree_map] t2 ON t1.child_id = t2.competency_id
						INNER JOIN [dbo].[rpt_competency_ge2013_tree_map] t3 ON t2.child_id = t3.competency_id
						INNER JOIN [dbo].[rpt_competency_ge2013_score] s ON t3.child_id = s.competency_id
			)
		) AS t
		INNER JOIN [dbo].[student_degree_object_status] s ON t.student_id = s.student_id
		WHERE class_of_desc <> 'Hold'
		GROUP BY competency_id, class_of_desc
	OPEN c
		FETCH next FROM c INTO @CompetencyID, @year, @avg, @stddev, @count
		WHILE @@Fetch_Status = 0 BEGIN
			INSERT INTO [dbo].[rpt_competency_ge2013_metric] ( competency_id, name, value, student_class_of, format, [order] )
													  VALUES ( @CompetencyID, 'Average', @avg, @year, '0.0%', 1 )
			INSERT INTO [dbo].[rpt_competency_ge2013_metric] ( competency_id, name, value, student_class_of, format, [order] )
													  VALUES ( @CompetencyID, 'Standard Deviation', @stddev, @year, '0.00', 2 )
			INSERT INTO [dbo].[rpt_competency_ge2013_metric] ( competency_id, name, value, student_class_of, format, [order] )
													  VALUES ( @CompetencyID, '# of Scores', @count, @year, '0', 3 )
			FETCH next FROM c INTO @CompetencyID, @year, @avg, @stddev, @count
		END
	CLOSE c
	DEALLOCATE c

	-- Remove placeholder metrics
	-- ToDo: Replace with generic removal of single-child links
--    DELETE [dbo].[rpt_competency_ge2013_metric]
--		FROM [dbo].[rpt_competency_ge2013_metric] as m
--			INNER JOIN [dbo].[rpt_competency_ge2013] as c
--			ON m.competency_id = c.id
--			WHERE c.name = 'Comprehensive Basic Science Exam'
END