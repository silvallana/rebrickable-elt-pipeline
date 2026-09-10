WITH themes AS (

    SELECT *
    FROM {{ ref('stg_themes') }}

)

SELECT
    id,
    name,
    parent_id AS parent_theme_id

FROM themes