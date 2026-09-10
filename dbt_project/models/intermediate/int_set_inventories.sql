WITH sets as (

    SELECT * 
    FROM {{ ref('stg_sets') }}

),

inventories AS (

    SELECT * 
    FROM {{ ref('stg_inventories') }}

),

set_inventories AS (

    SELECT inventories.id AS inventory_id,
    inventories.version AS inventory_version,
    inventories.set_num,

    ROW_NUMBER() OVER (
            PARTITION BY inventories.set_num
            ORDER BY inventories.version DESC
    ) AS inventory_version_rank

    FROM inventories

    INNER JOIN sets
        ON inventories.set_num = sets.set_num

)

SELECT
    inventory_id,
    inventory_version,
    set_num,

    inventory_version_rank = 1 AS is_latest_version

FROM set_inventories
