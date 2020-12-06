-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no)
employees.emp_no,
employees.first_name,
employees.last_name,
titles.title,
titles.from_date,
titles.to_date

INTO retirement_titles
FROM employees 
INNER JOIN titles
	ON(employees.emp_no = titles.emp_no)
WHERE (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY employees.emp_no, titles.to_date DESC;

-- unique titles
SELECT DISTINCT ON (emp_no)
rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;

--number of employees by their most recent job title who are about to retire
SELECT count(ut.emp_no) AS count_,
ut.title
INTO retiring_titles
FROM unique_titles as ut 
GROUP BY ut.title
ORDER BY count_ DESC;

--create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program.
SELECT DISTINCT ON (emp_no)
employees.emp_no,
employees.first_name,
employees.last_name,
employees.birth_date,
de.from_date,
de.to_date,
titles.title
INTO mentorship_eligibilty
FROM employees
INNER JOIN dept_emp as de
ON (employees.emp_no = de.emp_no)
INNER JOIN titles
ON(employees.emp_no = titles.emp_no)
WHERE (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY employees.emp_no ASC;





