{{
    config(
        unique_key='file_key'
    )
}}

select
    file_id file_key,
    repository_name,
    reference,
    path,
    permission_mode
FROM
    {{ref('files')}}
JOIN
    {{ref('contents')}}
USING (file_id)
