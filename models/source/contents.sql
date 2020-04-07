SELECT
  id file_id,
  size,
  content,
  CASE BINARY
    WHEN TRUE THEN 'Binary'
  ELSE
    'Character'
  END content_type,
  copies num_copies
FROM
  bigquery-public-data.github_repos.contents