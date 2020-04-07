SELECT
  commit,
  tree,
  parent,
  author.name author_name,
  author.email author_email,
  author.date.seconds author_date_seconds,
  committer.name committer_name,
  committer.email committer_email,
  committer.date.seconds committer_date_seconds,
  subject,
  message,
  repo_name
from bigquery-public-data.github_repos.commits