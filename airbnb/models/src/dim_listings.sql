{# cleaning
- strip '$' from "price_str", rename into "price_str"
- minimum_nights must be at least of 1 
#}


with src_listings as (
  select * from {{ ref("src_listings")}}
)
  select
    listing_id,
    listing_name,
    listing_url,
    room_type,
    case 
      when minimum_nights < 1 then 1
      else minimum_nights
    end as minimum_nights,
    host_id,
    replace(price_str, '$')::number(10,2) as price,
    created_at,
    updated_at
  from src_listings