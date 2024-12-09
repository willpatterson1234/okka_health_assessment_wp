with src_reviews AS (
    SELECT * FROM dev.reviews
)

SELECT 
    id,
    listing_id, 
    "date", 
    reviewer_id, 
    comments
FROM src_reviews
