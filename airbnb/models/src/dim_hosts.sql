{# replace missing "host_name" (empty, ie. NULL values) with the string 'Anonymous' #}

with src_hosts as (
  select * from {{ ref("src_hosts") }}
)
  select
    host_id,
    coalesce(host_name, 'Anonymous') as host_name,
    is_superhost,
    created_at, updated_at
  from src_hosts