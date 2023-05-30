SELECT name,  average_assistance_time
FROM (SELECT cohorts.name as name, avg(assistance_requests.completed_at - assistance_requests.started_at) as average_assistance_time
      FROM assistance_requests
      JOIN students ON students.id = assistance_requests.student_id
      JOIN cohorts ON cohorts.id = students.cohort_id
      GROUP BY cohorts.name) as average_assist_times
WHERE average_assistance_time = (SELECT max(average_assistance_time) 
                                 FROM (SELECT cohorts.name as name, avg(assistance_requests.completed_at - assistance_requests.started_at) as average_assistance_time
                                       FROM assistance_requests
                                       JOIN students ON students.id = assistance_requests.student_id
                                       JOIN cohorts ON cohorts.id = students.cohort_id
                                       GROUP BY cohorts.name) as sub) ;
      