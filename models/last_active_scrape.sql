WITH combined_listings AS (
    SELECT * FROM {{ ref('combined_listings') }}
),
last_active AS (
    SELECT
        listing_id,
        MAX(CASE WHEN source = 'listings_2' THEN scraped_date END) AS last_active_scrape_month
    FROM combined_listings
    GROUP BY listing_id
)
SELECT
    la.listing_id,
    COALESCE(la.last_active_scrape_month, ls.latest_scrape_month) AS last_active_scrape_month
FROM last_active la
JOIN {{ ref('active_listings') }} ls
    ON la.listing_id = ls.listing_id

