WITH elements AS (

    SELECT *
    FROM {{ ref('stg_elements') }}

)

SELECT
    element_id,
    part_num,
    color_id

FROM elements