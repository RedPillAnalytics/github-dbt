{{
    config(
        unique_key='repository_key'
    )
}}

select
  {{dbt_utils.surrogate_key('repository_name','license_name')}} repository_key,
  repository_name,
  license_name
from (
    select
      REPOSITORY_NAME,
      IFNULL(LICENSE_NAME,'Not Applicable') LICENSE_NAME
    FROM
      {{ref('repositories')}}
)
