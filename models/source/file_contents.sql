with contents as (
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
)
SELECT
  -- removing content because it slows down demo
  * except(content)
FROM
  contents
JOIN
  {{ref('files')}}
USING
  (file_id)