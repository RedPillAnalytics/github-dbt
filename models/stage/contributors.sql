select distinct 
  contributor_name,
  contributor_email
from (
    select
    author_name contributor_name,
    author_email contributor_email
    from {{ref('commits')}}
    UNION DISTINCT
    select 
    committer_name,
    committer_email
    from {{ref('commits')}}
)
