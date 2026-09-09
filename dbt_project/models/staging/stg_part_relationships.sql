WITH source AS (

    SELECT *
    FROM {{ source('raw', 'part_relationships') }}

),

staged AS (

    SELECT
        rel_type,
        child_part_num,
        parent_part_num
    FROM source

)

SELECT *
FROM staged