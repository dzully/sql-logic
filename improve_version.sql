SELECT
    Jobs.id AS `Jobs__id`,
    Jobs.name AS `Jobs__name`,
    Jobs.media_id AS `Jobs__media_id`,
    Jobs.job_category_id AS `Jobs__job_category_id`,
    Jobs.job_type_id AS `Jobs__job_type_id`,
    Jobs.description AS `Jobs__description`,
    Jobs.detail AS `Jobs__detail`,
    Jobs.business_skill AS `Jobs__business_skill`,
    Jobs.knowledge AS `Jobs__knowledge`,
    Jobs.location AS `Jobs__location`,
    Jobs.activity AS `Jobs__activity`,
    Jobs.academic_degree_doctor AS `Jobs__academic_degree_doctor`,
    Jobs.academic_degree_master AS `Jobs__academic_degree_master`,
    Jobs.academic_degree_professional AS `Jobs__academic_degree_professional`,
    Jobs.academic_degree_bachelor AS `Jobs__academic_degree_bachelor`,
    Jobs.salary_statistic_group AS `Jobs__salary_statistic_group`,
    Jobs.salary_range_first_year AS `Jobs__salary_range_first_year`,
    Jobs.salary_range_average AS `Jobs__salary_range_average`,
    Jobs.salary_range_remarks AS `Jobs__salary_range_remarks`,
    Jobs.restriction AS `Jobs__restriction`,
    Jobs.estimated_total_workers AS `Jobs__estimated_total_workers`,
    Jobs.remarks AS `Jobs__remarks`,
    Jobs.url AS `Jobs__url`,
    Jobs.seo_description AS `Jobs__seo_description`,
    Jobs.seo_keywords AS `Jobs__seo_keywords`,
    Jobs.sort_order AS `Jobs__sort_order`,
    Jobs.publish_status AS `Jobs__publish_status`,
    Jobs.version AS `Jobs__version`,
    Jobs.created_by AS `Jobs__created_by`,
    Jobs.created AS `Jobs__created`,
    Jobs.modified AS `Jobs__modified`,
    Jobs.deleted AS `Jobs__deleted`,
    JobCategories.id AS `JobCategories__id`,
    JobCategories.name AS `JobCategories__name`,
    JobCategories.sort_order AS `JobCategories__sort_order`,
    JobCategories.created_by AS `JobCategories__created_by`,
    JobCategories.created AS `JobCategories__created`,
    JobCategories.modified AS `JobCategories__modified`,
    JobCategories.deleted AS `JobCategories__deleted`,
    JobTypes.id AS `JobTypes__id`,
    JobTypes.name AS `JobTypes__name`,
    JobTypes.job_category_id AS `JobTypes__job_category_id`,
    JobTypes.sort_order AS `JobTypes__sort_order`,
    JobTypes.created_by AS `JobTypes__created_by`,
    JobTypes.created AS `JobTypes__created`,
    JobTypes.modified AS `JobTypes__modified`,
    JobTypes.deleted AS `JobTypes__deleted`
FROM
    jobs Jobs
    LEFT JOIN (
        SELECT
            job_id,
            GROUP_CONCAT(DISTINCT personality_id) AS personality_ids
        FROM
            jobs_personalities
        WHERE
            deleted IS NULL
        GROUP BY
            job_id
    ) AS JobsPersonalities ON Jobs.id = JobsPersonalities.job_id
    LEFT JOIN personalities Personalities ON Personalities.id IN (JobsPersonalities.personality_ids)
    LEFT JOIN (
        SELECT
            job_id,
            GROUP_CONCAT(DISTINCT practical_skill_id) AS practical_skill_ids
        FROM
            jobs_practical_skills
        WHERE
            deleted IS NULL
        GROUP BY
            job_id
    ) AS JobsPracticalSkills ON Jobs.id = JobsPracticalSkills.job_id
    LEFT JOIN practical_skills PracticalSkills ON PracticalSkills.id IN (JobsPracticalSkills.practical_skill_ids)
    LEFT JOIN (
        SELECT
            job_id,
            GROUP_CONCAT(DISTINCT basic_ability_id) AS basic_ability_ids
        FROM
            jobs_basic_abilities
        WHERE
            deleted IS NULL
        GROUP BY
            job_id
    ) AS JobsBasicAbilities ON Jobs.id = JobsBasicAbilities.job_id
    LEFT JOIN basic_abilities BasicAbilities ON BasicAbilities.id IN (JobsBasicAbilities.basic_ability_ids)
    LEFT JOIN jobs_tools JobsTools ON Jobs.id = JobsTools.job_id
    LEFT JOIN (
        SELECT
            affiliate_id,
            GROUP_CONCAT(DISTINCT job_id) AS job_ids
        FROM
            jobs_tools
        WHERE
            type = 1
            AND deleted IS NULL
        GROUP BY
            affiliate_id
    ) AS AffiliateJobs ON JobsTools.affiliate_id = AffiliateJobs.affiliate_id
    AND Jobs.id IN (AffiliateJobs.job_ids)
    LEFT JOIN jobs_career_paths JobsCareerPaths ON Jobs.id = JobsCareerPaths.job_id
    LEFT JOIN career_paths CareerPaths ON CareerPaths.id = JobsCareerPaths.career_path_id
WHERE
    Jobs.deleted IS NULL
    AND JobCategories.deleted IS NULL
    AND JobTypes.deleted IS NULL
ORDER BY
    Jobs.modified DESC
LIMIT
    10;