WITH source AS (

    SELECT *
    FROM {{ source('raw', 'minifigs') }}

),

staged AS (

    SELECT
        fig_num,
        name,
        CAST(num_parts AS INTEGER) AS num_parts,
        img_url
    FROM source

)

SELECT *
FROM staged