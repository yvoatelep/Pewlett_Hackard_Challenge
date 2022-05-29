--Create mentorship eligibility table
SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
    e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO Mentorship_Eligibility
FROM employees AS e
INNER JOIN dept_employees as de
ON e.emp_no = de.emp_no
INNER JOIN titles as t
ON t.emp_no = de.emp_no
WHERE de.to_date ='9999-01-01'
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')