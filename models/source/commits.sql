SELECT
  commit,
  tree,
  author.name author_name,
  author.email author_email,
  author.date.seconds author_date_seconds,
  committer.name committer_name,
  committer.email committer_email,
  committer.date.seconds committer_date_seconds,
  subject,
  message,
  repository_name
FROM
  bigquery-public-data.github_repos.commits,
  UNNEST(repo_name) AS repository_name