{{
    config(
        unique_key='commit_sha',
    )
}}

with detail as (
    select
        {{dbt_utils.surrogate_key('author_name','author_email')}} contributor_key,
        {{dbt_utils.surrogate_key('repository_name')}} repository_key,
        commit commit_sha,
        subject,
        message,
        author_timestamp commit_timestamp,
        size,
        CASE CONTENT_TYPE when 'Character' then 1 else 0 END num_character,
        CASE CONTENT_TYPE when 'Binary' then 1 else 0 END num_binary,
        file_id
    FROM
        {{ref('commits')}}
    JOIN
        {{ref('files')}}
    USING
        (repository_name)
    JOIN
        {{ref('contents')}}
    USING
        (file_id)
)
select
    contributor_key,
    repository_key,
    commit_sha,
    subject,
    message,
    commit_timestamp,
    sum(size) total_size,
    sum(num_character) total_character_files,
    sum(num_character) total_binary_files,
    count(file_id) total_files
FROM
    detail
GROUP BY
    contributor_key,
    repository_key,
    commit_sha,
    subject,
    message,
    commit_timestamp

