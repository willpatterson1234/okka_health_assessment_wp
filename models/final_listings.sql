WITH latest_status AS (
    SELECT * FROM {{ref('active_listings')}}
),
last_active_scrape AS(
    SELECT * FROM {{ref('last_active_scrape')}}
),
combined_listings AS (
    SELECT 
        listing_id,
        amenities
    FROM {{ref("combined_listings")}}
)
SELECT 
    ls.listing_id,
    c.amenities,
    strftime(la.last_active_scrape_month, '%Y-%m'),
    ls.is_listing_active,
FROM latest_status ls
JOIN last_active_scrape la 
    ON ls.listing_id = la.listing_id
JOIN combined_listings c 
    ON ls.listing_id = c.listing_id
