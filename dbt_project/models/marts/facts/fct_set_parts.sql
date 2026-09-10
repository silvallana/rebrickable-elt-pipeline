WITH set_inventory_parts AS (

    SELECT *
    FROM {{ ref('int_set_inventory_parts') }}

),

parts AS (

    SELECT *
    FROM {{ ref('dim_parts') }}

),

colors AS (

    SELECT *
    FROM {{ ref('dim_colors') }}

)

SELECT
    set_inventory_parts.set_num,
    set_inventory_parts.inventory_id,
    set_inventory_parts.inventory_version,
    set_inventory_parts.is_latest_version,

    set_inventory_parts.part_num,
    parts.name AS part_name,

    set_inventory_parts.color_id,
    colors.name AS color_name,

    set_inventory_parts.quantity,
    set_inventory_parts.is_spare

FROM set_inventory_parts

LEFT JOIN parts
    ON set_inventory_parts.part_num = parts.part_num

LEFT JOIN colors
    ON set_inventory_parts.color_id = colors.id