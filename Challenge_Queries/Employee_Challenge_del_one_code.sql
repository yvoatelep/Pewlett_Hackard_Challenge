-- Create Retirement Titles
SELECT e.emp_no,
    e.first_name,
	e.last_name,
	e.birth_date,
    t.title,
	t.from_date,
	t.to_date
INTO del_one
FROM employees as e
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

--Create Unique_titles
SELECT DISTINCT ON (emp_no) emp_no,first_name,last_name,title
INTO unique_titles
FROM del_one
WHERE to_date ='9999-01-01'
ORDER BY emp_no, to_date DESC;

-- Titles retiring count
SELECT COUNT(ut.title)count,title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count DESC;
