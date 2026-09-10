WITH set_inventories AS (
    
    SELECT *
    FROM {{  ref('int_set_inventories') }}

),

inventory_parts AS (

    SELECT *
    FROM {{  ref('stg_inventory_parts') }}

)

SELECT
    set_inventories.set_num,
    set_inventories.inventory_id,
    set_inventories.inventory_version,
    set_inventories.is_latest_version,

    inventory_parts.part_num,
    inventory_parts.color_id,
    inventory_parts.quantity,
    inventory_parts.is_spare

FROM set_inventories

INNER JOIN inventory_parts
    ON set_inventories.inventory_id = inventory_parts.inventory_id