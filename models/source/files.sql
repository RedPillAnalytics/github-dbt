with files as (
  select
    id file_id,
    repo_name repository_name,
    ref reference,
    path,
    mode permission_mode
  FROM
    bigquery-public-data.github_repos.files
)
select
  *
from files
JOIN
  {{ref('commits')}}
USING
  (repository_name)