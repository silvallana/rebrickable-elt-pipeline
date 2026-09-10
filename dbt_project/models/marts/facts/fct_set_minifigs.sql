WITH set_inventory_minifigs AS (

    SELECT *
    FROM {{ ref('int_set_inventory_minifigs') }}

),

minifigs AS (

    SELECT *
    FROM {{ ref('dim_minifigs') }}

)

SELECT
    set_inventory_minifigs.set_num,
    set_inventory_minifigs.inventory_id,
    set_inventory_minifigs.inventory_version,
    set_inventory_minifigs.is_latest_version,

    set_inventory_minifigs.fig_num,
    minifigs.name AS fig_name,

    set_inventory_minifigs.quantity

FROM set_inventory_minifigs

LEFT JOIN minifigs
    ON set_inventory_minifigs.fig_num = minifigs.fig_num