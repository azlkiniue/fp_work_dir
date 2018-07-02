# SENSOR RELATED TABLE

CREATE TABLE kaspa.sensor_by_company(
    company text,
    device_id text,
    hostname text,
    ip_address text,
    netint text,
    location text,
    topic_global text,
    topic_cmd text,
    topic_resp text,
    time_created timestamp,
    PRIMARY KEY (company, device_id)
) WITH CLUSTERING ORDER BY (device_id ASC)

CREATE TABLE kaspa.sensor_by_device_id(
    company text,
    device_id text,
    hostname text,
    ip_address text,
    netint text,
    location text,
    topic_global text,
    topic_cmd text,
    topic_resp text,
    time_created timestamp,
    PRIMARY KEY (device_id, company)
) WITH CLUSTERING ORDER BY (company ASC)

# PUSH RAW DATA TABLE

CREATE TABLE kaspa.raw_data_by_device_id(
    time_uuid timeuuid,
    company text,
    device_id text,
    protocol text,
    ip_type text,
    src_mac text,
    dest_mac text,
    src_ip text,
    dest_ip text,
    src_port int,
    dst_port int,
    alert_msg text,
    classification int,
    priority int,
    sig_id int,
    sig_gen int,
    sig_rev int,
    src_country text,
    PRIMARY KEY ((device_id), time_uuid)
) WITH CLUSTERING ORDER BY (time_uuid DESC)

CREATE TABLE kaspa.raw_data_by_company(
    time_uuid timeuuid,
    company text,
    device_id text,
    protocol text,
    ip_type text,
    src_mac text,
    dest_mac text,
    src_ip text,
    dest_ip text,
    src_port int,
    dst_port int,
    alert_msg text,
    classification int,
    priority int,
    sig_id int,
    sig_gen int,
    sig_rev int,
    src_country text,
    PRIMARY KEY ((company), device_id, time_uuid)
) WITH CLUSTERING ORDER BY (device_id ASC, time_uuid DESC)

# USER RELATED TABLE

CREATE TABLE kaspa.user_by_username(
    username text,
    email text,
    password_hash text,
    api_key text,
    token text,
    group text,
    time_joined timestamp,
    PRIMARY KEY (username)
)

CREATE TABLE kaspa.user_by_company(
    username text,
    email text,
    password_hash text,
    api_key text,
    token text,
    group text,
    time_joined timestamp,
    PRIMARY KEY (company)
)

CREATE TABLE kaspa.list_user_by_group(
    username text,
    email text,
    password_hash text,
    api_key text,
    token text,
    group text,
    time_joined timestamp,
    PRIMARY KEY (group, username)
) WITH CLUSTERING ORDER BY (username ASC)

# EVENT COUNT AGGREGATE

CREATE TABLE kaspa.event_hit_per_company_sec(
    company text,
    device_id text,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
    value counter,
    PRIMARY KEY ((company), device_id, year, month, day, hour, minute, second)
) WITH CLUSTERING ORDER BY (device_id ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC)

CREATE TABLE kaspa.event_hit_per_company_minute(
    company text,
    device_id text,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    value counter,
    PRIMARY KEY ((company), device_id, year, month, day, hour, minute)
) WITH CLUSTERING ORDER BY (device_id ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC)

CREATE TABLE kaspa.event_hit_per_company_hour(
    company text,
    device_id text,
    year int,
    month int,
    day int,
    hour int,
    value counter,
    PRIMARY KEY ((company), device_id, year, month, day, hour)
) WITH CLUSTERING ORDER BY (device_id ASC, year DESC, month DESC, day DESC, hour DESC)

CREATE TABLE kaspa.event_hit_per_company_day(
    company text,
    device_id text,
    year int,
    month int,
    day int,
    value counter,
    PRIMARY KEY ((company), device_id, year, month, day)
) WITH CLUSTERING ORDER BY (device_id ASC, year DESC, month DESC, day DESC)

CREATE TABLE kaspa.event_hit_per_company_month(
    company text,
    device_id text,
    year int,
    month int,
    value counter,
    PRIMARY KEY ((company), device_id, year, month)
) WITH CLUSTERING ORDER BY (device_id ASC, year DESC, month DESC)

CREATE TABLE kaspa.event_hit_per_company_year(
    company text,
    device_id text,
    year int,
    value counter,
    PRIMARY KEY ((company), device_id, year)
) WITH CLUSTERING ORDER BY (device_id ASC, year DESC)

CREATE TABLE kaspa.event_hit_per_device_id_sec(
    company text,
    device_id text,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
    value counter,
    PRIMARY KEY ((device_id), company, year, month, day, hour, minute, second)
) WITH CLUSTERING ORDER BY (company ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC)

CREATE TABLE kaspa.event_hit_per_device_id_minute(
    company text,
    device_id text,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    value counter,
    PRIMARY KEY ((device_id), company, year, month, day, hour, minute)
) WITH CLUSTERING ORDER BY (company ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC)

CREATE TABLE kaspa.event_hit_per_device_id_hour(
    company text,
    device_id text,
    year int,
    month int,
    day int,
    hour int,
    value counter,
    PRIMARY KEY ((device_id), company, year, month, day, hour)
) WITH CLUSTERING ORDER BY (company ASC, year DESC, month DESC, day DESC, hour DESC)

CREATE TABLE kaspa.event_hit_per_device_id_day(
    company text,
    device_id text,
    year int,
    month int,
    day int,
    value counter,
    PRIMARY KEY ((device_id), company, year, month, day)
) WITH CLUSTERING ORDER BY (company ASC, year DESC, month DESC, day DESC)

CREATE TABLE kaspa.event_hit_per_device_id_month(
    company text,
    device_id text,
    year int,
    month int,
    value counter,
    PRIMARY KEY ((device_id), company, year, month)
) WITH CLUSTERING ORDER BY (company ASC, year DESC, month DESC)

CREATE TABLE kaspa.event_hit_per_device_id_month(
    company text,
    device_id text,
    year int,
    value counter,
    PRIMARY KEY ((device_id), company, year)
) WITH CLUSTERING ORDER BY (company ASC, year DESC)