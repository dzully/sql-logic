CREATE DATABASE job_database;

USE job_database;

CREATE TABLE jobs (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    media_id INT,
    job_category_id INT,
    job_type_id INT,
    description TEXT,
    detail TEXT,
    business_skill TEXT,
    knowledge TEXT,
    location TEXT,
    activity TEXT,
    academic_degree_doctor TEXT,
    academic_degree_master TEXT,
    academic_degree_professional TEXT,
    academic_degree_bachelor TEXT,
    salary_statistic_group TEXT,
    salary_range_first_year INT,
    salary_range_average INT,
    salary_range_remarks TEXT,
    restriction TEXT,
    estimated_total_workers INT,
    remarks TEXT,
    url TEXT,
    seo_description TEXT,
    seo_keywords TEXT,
    sort_order INT,
    publish_status INT,
    version INT,
    created_by INT,
    created DATETIME,
    modified DATETIME,
    deleted DATETIME
);

CREATE TABLE job_categories (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    sort_order INT,
    created_by INT,
    created DATETIME,
    modified DATETIME,
    deleted DATETIME
);

CREATE TABLE job_types (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    job_category_id INT,
    sort_order INT,
    created_by INT,
    created DATETIME,
    modified DATETIME,
    deleted DATETIME
);

CREATE TABLE personalities (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    created_by INT,
    created DATETIME,
    modified DATETIME,
    deleted DATETIME
);

CREATE TABLE practical_skills (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    created_by INT,
    created DATETIME,
    modified DATETIME,
    deleted DATETIME
);

CREATE TABLE basic_abilities (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    created_by INT,
    created DATETIME,
    modified DATETIME,
    deleted DATETIME
);

CREATE TABLE jobs_personalities (
    id INT PRIMARY KEY,
    job_id INT,
    personality_id INT,
    deleted DATETIME
);

CREATE TABLE jobs_practical_skills (
    id INT PRIMARY KEY,
    job_id INT,
    practical_skill_id INT,
    deleted DATETIME
);

CREATE TABLE jobs_basic_abilities (
    id INT PRIMARY KEY,
    job_id INT,
    basic_ability_id INT,
    deleted DATETIME
);

CREATE TABLE jobs_tools (
    id INT PRIMARY KEY,
    job_id INT,
    affiliate_id INT,
    type INT,
    deleted DATETIME
);

CREATE TABLE jobs_career_paths (
    id INT PRIMARY KEY,
    job_id INT,
    career_path_id INT,
    deleted DATETIME
);

CREATE TABLE career_paths (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    created_by INT,
    created DATETIME,
    modified DATETIME,
    deleted DATETIME
);