SELECT count(*),  teachers.name as name
FROM assistance_requests
JOIN teachers ON teachers.id = assistance_requests.teacher_id
WHERE teachers.name = 'Waylon Boehm'
Group By teachers.name;