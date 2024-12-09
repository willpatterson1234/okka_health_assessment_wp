WITH final_listings AS (
    SELECT * FROM {{ ref("final_listings") }}
),

final_active_listings AS (
    SELECT * FROM final_listings
    WHERE is_listing_active = TRUE
),

unique_ammenities AS (
    SELECT * FROM {{ ref("unique_ammenities") }}
),

reviews AS (
    SELECT * FROM {{ ref("src_reviews") }}
),

total_amenities AS (
    SELECT 
        listing_id, 
        COUNT(DISTINCT unique_amenity) AS total_amenities
    FROM unique_ammenities
    GROUP BY listing_id
),

reviews_with_ammenities AS (
    SELECT
        r.listing_id,
        r.date, 
        r.reviewer_id,
        r.comments,
        u.unique_amenity,
        t.total_amenities
    FROM reviews r
    JOIN unique_ammenities u 
        ON r.listing_id = u.listing_id
    JOIN total_amenities t
        ON r.listing_id = t.listing_id
)

SELECT 
    r.listing_id,
    r.date,
    r.reviewer_id,
    r.comments,
    r.unique_amenity,
    r.total_amenities
FROM reviews_with_ammenities r
JOIN final_active_listings f
    ON r.listing_id = f.listing_id