WITH set_inventories AS (

    SELECT *
    FROM {{ ref('int_set_inventories') }}

),

inventory_minifigs AS (

    SELECT *
    FROM {{ ref('stg_inventory_minifigs') }}

)

SELECT
    set_inventories.set_num,
    set_inventories.inventory_id,
    set_inventories.inventory_version,
    set_inventories.is_latest_version,

    inventory_minifigs.fig_num,
    inventory_minifigs.quantity

FROM set_inventories

INNER JOIN inventory_minifigs
    ON set_inventories.inventory_id = inventory_minifigs.inventory_id