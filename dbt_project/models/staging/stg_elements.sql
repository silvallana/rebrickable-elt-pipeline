WITH source AS (

    SELECT *
    FROM {{ source('raw', 'elements') }}

),

staged AS (

    SELECT
        element_id,
        part_num,
        CAST(color_id AS INTEGER) AS color_id
    FROM source

)

SELECT *
FROM staged