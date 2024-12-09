select 
    id AS listing_id, 
    amenities, 
    last_scraped AS scraped_date,
    'listings_1' AS source
from {{ ref("src_listings_1") }}

UNION ALL

select 
    id as listing_id, 
    amenities, 
    last_scraped AS scraped_date, 
    'listings_2' AS source
from {{ ref('src_listings_2') }}