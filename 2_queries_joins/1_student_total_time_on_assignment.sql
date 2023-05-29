SELECT SUM(assignment_submissions.duration) AS Total_Duration
FROM assignment_submissions
JOIN students ON students.id = assignment_submissions.student_id
WHERE students.name = 'Ibrahim Schimmel';