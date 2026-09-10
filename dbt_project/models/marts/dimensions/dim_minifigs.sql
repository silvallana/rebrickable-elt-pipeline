WITH minifigs AS (

    SELECT *
    FROM {{ ref('stg_minifigs') }}

)

SELECT
    fig_num,
    name,
    num_parts,
    img_url

FROM minifigs