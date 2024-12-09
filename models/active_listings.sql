WITH total_listings AS (
    SELECT * FROM {{ ref("combined_listings") }}
),

latest_listing_scrape AS (
    SELECT 
        listing_id, 
        MAX(scraped_date) AS latest_scrape_month
    FROM
        total_listings 
    GROUP BY listing_id
),

active_listing AS (
    SELECT 
    ls.listing_id, 
    ls.latest_scrape_month,
    CASE
        WHEN lsrc.id IS NOT NULL THEN TRUE
            ELSE FALSE
        END AS is_listing_active
    FROM latest_listing_scrape ls
    LEFT JOIN {{ ref('src_listings_2') }} lsrc
        ON lsrc.id = ls.listing_id
)

SELECT * FROM active_listing

