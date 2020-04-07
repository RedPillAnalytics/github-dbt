with sample as (
  SELECT
    commit,
    tree,
    author.name author_name,
    author.email author_email,
    timestamp_seconds(author.date.seconds) author_timestamp,
    committer.name committer_name,
    committer.email committer_email,
    timestamp_seconds(committer.date.seconds) committer_timestamp,
    subject,
    message,
    repository_name,
    RAND() sample_num
  FROM
    bigquery-public-data.github_repos.commits,
    UNNEST(repo_name) AS repository_name
)
select * except(sample_num)
from sample
order by sample_num
limit 100000
