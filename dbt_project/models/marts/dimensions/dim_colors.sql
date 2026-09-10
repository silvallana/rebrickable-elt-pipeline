WITH colors AS (

    SELECT *
    FROM {{ ref('stg_colors') }}

)

SELECT
    id,
    name,
    rgb,
    is_trans,
    num_parts,
    num_sets,
    first_year,
    last_year

FROM colors