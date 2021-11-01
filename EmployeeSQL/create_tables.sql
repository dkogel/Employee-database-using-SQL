-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/YC8Y8V
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "departments" (
    "dept_no" varchar(250)   NOT NULL,
    "dept_name" varchar(250)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "department_emp" (
    "emp_no" varchar(250)   NOT NULL,
    "dept_no" varchar(250)   NOT NULL,
    CONSTRAINT "pk_department_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "dept_manager" (
    "dep_no" varchar(250)   NOT NULL,
    "emp_no" varchar(250)   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dep_no","emp_no"
     )
);

CREATE TABLE "employees" (
    "emp_no" varchar(250)   NOT NULL,
    "emp_title" varchar(250)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(250)   NOT NULL,
    "last_name" varchar(250)   NOT NULL,
    "sex" varchar(250)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" varchar(250)   NOT NULL,
    "salary" float   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "titles" (
    "title_id" varchar(250)   NOT NULL,
    "title" varchar(250)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "department_emp" ADD CONSTRAINT "fk_department_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "department_emp" ADD CONSTRAINT "fk_department_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dep_no" FOREIGN KEY("dep_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title" FOREIGN KEY("emp_title")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");






