select
    u.user_id,
    u.state,
    u.zip_code
from {{ ref('stg_users') }} u
left join {{ ref('state_zip_prefixes') }} p
    on u.state = p.state
    and left(u.zip_code, 2) = p.prefix
where p.state is null
and u.state is not null
and u.zip_code is not null
