WITH source as (

    SELECT * 
    FROM {{ source('raw', 'parts') }}

),

staged AS (

    SELECT
        part_num,
        name,
        CAST(part_cat_id AS INTEGER) AS part_cat_id,
        part_material
    FROM source

)

SELECT *
FROM staged