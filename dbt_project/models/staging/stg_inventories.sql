WITH source AS (

    SELECT *
    FROM {{ source('raw', 'inventories') }}

),

staged AS (

    SELECT
        CAST(id AS INTEGER) AS id,
        CAST(version AS INTEGER) AS version,
        set_num
    FROM source

)

SELECT *
FROM staged