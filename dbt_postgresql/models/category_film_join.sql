WITH film_category_with_category AS (
    SELECT
        fc.film_id,
        fc.last_update AS film_last_update,
        c.category_id,
        c.name AS category_name,
        c.last_update AS category_last_update
    FROM
        {{ ref('film_category_model') }} fc
    JOIN
        {{ ref('category_model') }} c
    ON
        fc.category_id = c.category_id
)

SELECT
    fcwc.film_id,
    fcwc.film_last_update,
    fcwc.category_id,
    fcwc.category_name,
    fcwc.category_last_update
FROM
    film_category_with_category fcwc
