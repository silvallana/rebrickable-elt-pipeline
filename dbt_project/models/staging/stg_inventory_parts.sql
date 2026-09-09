WITH source AS (

    SELECT *
    FROM {{ source('raw', 'inventory_parts') }}

),

staged AS (

    SELECT
        CAST(inventory_id AS INTEGER) AS inventory_id,
        part_num,
        CAST(color_id AS INTEGER) AS color_id,
        CAST(quantity AS INTEGER) AS quantity,
        CAST(is_spare AS BOOLEAN) AS is_spare
    FROM source

)

SELECT *
FROM staged