WITH source AS (

    SELECT *
    FROM {{ source('raw', 'inventory_sets') }}

),

staged AS (

    SELECT
        CAST(inventory_id AS INTEGER) AS inventory_id,
        set_num,
        CAST(quantity AS INTEGER) AS quantity
    FROM source

)

SELECT *
FROM staged