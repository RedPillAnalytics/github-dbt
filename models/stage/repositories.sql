with repositories as (
    select distinct
      REPOSITORY_NAME
    FROM
      {{ref('commits')}}
)
SELECT
  REPOSITORY_NAME,
  license_name
FROM
  repositories
FULL OUTER JOIN
  {{ref('licenses')}}
  USING (REPOSITORY_NAME)
