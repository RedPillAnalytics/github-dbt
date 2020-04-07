with contents as (
  SELECT
    id file_id,
    size,
    -- REMOVED content column because it slows everything down
    --content,
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
  *
FROM
  contents
JOIN
  {{ref('files')}}
USING
  (file_id)