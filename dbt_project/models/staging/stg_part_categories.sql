WITH source as (

    SELECT * 
    FROM {{ source('raw', 'part_categories') }}

),

staged AS (

    SELECT
        CAST(id as INTEGER) AS id,
        name
    FROM source

)

SELECT *
FROM staged