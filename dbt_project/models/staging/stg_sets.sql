WITH source AS (

    SELECT *
    FROM {{ source('raw', 'sets') }}

),

staged AS (

    SELECT
        set_num,
        name,
        CAST(year AS INTEGER) AS year,
        CAST(theme_id AS INTEGER) AS theme_id,
        CAST(num_parts AS INTEGER) AS num_parts,
        img_url
    FROM source

)

SELECT *
FROM staged