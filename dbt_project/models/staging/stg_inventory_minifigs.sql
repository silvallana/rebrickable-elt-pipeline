WITH source AS (

    SELECT *
    FROM {{ source('raw', 'inventory_minifigs') }}

),

staged AS (

    SELECT
        CAST(inventory_id AS INTEGER) AS inventory_id,
        fig_num,
        CAST(quantity AS INTEGER) AS quantity
    FROM source

)

SELECT *
FROM staged