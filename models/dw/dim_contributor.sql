{{
    config(
        unique_key='contributor_key'
    )
}}

select
    {{dbt_utils.surrogate_key('contributor_name','contributor_email')}} contributor_key,
    contributor_name,
    contributor_email
FROM
    {{ref('contributors')}}
