WITH ranked_reviews AS (
    SELECT
        id, 
        reviewer_id, 
        LENGTH(comments) AS review_length, 
        ROW_NUMBER() OVER(PARTITION BY reviewer_id ORDER BY "date") AS review_number, 
        COUNT(reviewer_id) OVER(PARTITION BY reviewer_id) AS total_reviews,
    FROM {{ref("src_reviews")}}
),
filtered_ranked_reviews AS(
    SELECT * 
    FROM ranked_reviews
    WHERE review_number = 2 and total_reviews >= 4
)

SELECT * FROM filtered_ranked_reviews