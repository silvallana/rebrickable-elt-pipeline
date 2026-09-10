WITH parts AS (

    SELECT *
    FROM {{ ref('stg_parts') }}

),

part_categories AS (

    SELECT *
    FROM {{ ref('stg_part_categories') }}

)

SELECT
    parts.part_num,
    parts.name,

    parts.part_cat_id,
    part_categories.name AS part_cat_name

FROM parts

LEFT JOIN part_categories
    ON parts.part_cat_id = part_categories.id
