WITH source as (

    SELECT * 
    FROM {{ source('raw', 'colors') }}

),

staged AS (

    SELECT
        CAST(id as INTEGER) AS id,
        name,
        rgb,
        CAST(is_trans AS BOOLEAN) AS is_trans,
        CAST(num_parts AS INTEGER) AS num_parts,
        CAST(num_sets AS INTEGER) AS num_sets,
        CAST(y1 AS INTEGER) AS first_year,
        CAST(y2 AS INTEGER) AS last_year
    FROM source

)

SELECT *
FROM staged