SELECT
  repo_name repository_name,
  name language_name
FROM
  bigquery-public-data.github_repos.languages,
  unnest(language) language_name