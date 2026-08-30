CREATE SCHEMA IF NOT EXISTS raw;

CREATE TABLE IF NOT EXISTS raw.themes (
    id TEXT, name TEXT, parent_id TEXT
);

CREATE TABLE IF NOT EXISTS raw.colors (
    id TEXT, name TEXT, rgb TEXT, is_trans TEXT, 
    num_parts TEXT, num_sets TEXT, y1 TEXT, y2 TEXT
);

CREATE TABLE IF NOT EXISTS raw.part_categories (
    id TEXT, name TEXT
);

CREATE TABLE IF NOT EXISTS raw.parts (
    part_num TEXT, name TEXT, part_cat_id TEXT, part_material TEXT
);

CREATE TABLE IF NOT EXISTS raw.part_relationships (
    rel_type TEXT, child_part_num TEXT, parent_part_num TEXT
);

CREATE TABLE IF NOT EXISTS raw.elements (
    element_id TEXT, part_num TEXT, color_id TEXT, design_id TEXT
);

CREATE TABLE IF NOT EXISTS raw.sets (
    set_num TEXT, name TEXT, year TEXT, theme_id TEXT, num_parts TEXT, img_url TEXT
);

CREATE TABLE IF NOT EXISTS raw.minifigs (
    fig_num TEXT, name TEXT, num_parts TEXT, img_url TEXT
);

CREATE TABLE IF NOT EXISTS raw.inventories (
    id TEXT, version TEXT, set_num TEXT
);

CREATE TABLE IF NOT EXISTS raw.inventory_parts (
    inventory_id TEXT, part_num TEXT, color_id TEXT, quantity TEXT, is_spare TEXT, img_url TEXT
);

CREATE TABLE IF NOT EXISTS raw.inventory_sets (
    inventory_id TEXT, set_num TEXT, quantity TEXT
);

CREATE TABLE IF NOT EXISTS raw.inventory_minifigs (
    inventory_id TEXT, fig_num TEXT, quantity TEXT
);