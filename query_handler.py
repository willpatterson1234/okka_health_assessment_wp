import duckdb
import pandas as pd


def query_handler(query: str):
    con = duckdb.connect('dev.duckdb')

    result = con.execute(query).fetchall()
    print(result)

    # for row in result:
    #     print(row)

# inactive_listings = query_handler(query ='SELECT COUNT(DISTINCT(listing_id)) FROM final_listings WHERE is_listing_active = TRUE' )

# review_len = query_handler(query =
# """
#     SELECT AVG(review_length) 
#     FROM ranked_reviews""")

# review_dish = query_handler(query ="""SELECT COUNT(DISTINCT(listing_id)) FROM reviews_with_ammenities WHERE unique_amenity =' "Dishwasher"' """)
# review_hair = query_handler(query ="""SELECT COUNT(DISTINCT(listing_id)) FROM reviews_with_ammenities WHERE unique_amenity =' "Hair dryer"' """)

# review_dish_hair = query_handler(query ="""SELECT COUNT(DISTINCT(listing_id)) FROM reviews_with_ammenities WHERE unique_amenity in (' "Hair dryer"',' "Dishwasher"')  AND total_amenities >= 2""")