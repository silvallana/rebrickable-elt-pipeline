WITH source as (

    SELECT * 
    FROM {{ source('raw', 'themes') }}

),

staged AS (

    SELECT
        CAST(id as INTEGER) AS id,
        name,
        CAST(parent_id AS INTEGER) as parent_id
    FROM source

)

SELECT *
FROM staged