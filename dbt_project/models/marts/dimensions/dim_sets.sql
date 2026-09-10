WITH sets AS (

    SELECT *
    FROM {{ ref('stg_sets') }}

)

SELECT
    set_num,
    name,
    year,
    theme_id,
    num_parts,
    img_url

FROM sets