WITH final_listings AS (
    SELECT * FROM {{ ref("final_listings") }}
),

final_active_listings AS (
    SELECT * FROM final_listings
    WHERE is_listing_active = TRUE
),
unique_ammenities AS (
    SELECT 
        listing_id, 
        UNNEST(string_to_array(amenities, ',')) AS unique_amenity
    FROM final_active_listings
)

SELECT * FROM unique_ammenities