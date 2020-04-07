
SELECT
  DISTINCT author_name contributor_name,
  author_email contributor_email
FROM
  {{ref('commits')}}
UNION DISTINCT
SELECT
  DISTINCT committer_name,
  committer_email
FROM
  {{ref('commits')}}
