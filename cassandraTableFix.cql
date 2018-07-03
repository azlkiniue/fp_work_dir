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

# EVENT HIT COUNT AGGREGATE

CREATE TABLE kaspa.event_hit_on_company_sec(
    company text,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
    value bigint, #Hit suatu company per detik
    PRIMARY KEY ((company), year, month, day, hour, minute, second)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC)

CREATE TABLE kaspa.event_hit_on_company_minute(
    company text,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    value bigint, #Hit suatu company per menit
    PRIMARY KEY ((company), year, month, day, hour, minute)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC)

CREATE TABLE kaspa.event_hit_on_company_hour(
    company text,
    year int,
    month int,
    day int,
    hour int,
    value bigint, #Hit suatu company per menit
    PRIMARY KEY ((company), year, month, day, hour)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC)

CREATE TABLE kaspa.event_hit_on_company_day(
    company text,
    year int,
    month int,
    day int,
    value bigint, #Hit suatu company per menit
    PRIMARY KEY ((company), year, month, day)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC)

CREATE TABLE kaspa.event_hit_on_company_month(
    company text,
    year int,
    month int,
    value bigint, #Hit suatu company per menit
    PRIMARY KEY ((company), year, month)
) WITH CLUSTERING ORDER BY (year DESC, month DESC)

CREATE TABLE kaspa.event_hit_on_company_year(
    company text,
    year int,
    value bigint, #Hit suatu company per menit
    PRIMARY KEY ((company), year)
) WITH CLUSTERING ORDER BY (year DESC)

CREATE TABLE kaspa.event_hit_on_device_id_sec(
    device_id text,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
    value bigint,
    PRIMARY KEY ((device_id), year, month, day, hour, minute, second)
) WITH CLUSTERING ORDER BY (device_id ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC)

CREATE TABLE kaspa.event_hit_on_device_id_minute(
    device_id text,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    value bigint,
    PRIMARY KEY ((device_id), year, month, day, hour, minute)
) WITH CLUSTERING ORDER BY (device_id ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC)

CREATE TABLE kaspa.event_hit_on_device_id_hour(
    device_id text,
    year int,
    month int,
    day int,
    hour int,
    value bigint,
    PRIMARY KEY ((device_id), year, month, day, hour)
) WITH CLUSTERING ORDER BY (device_id ASC, year DESC, month DESC, day DESC, hour DESC)

CREATE TABLE kaspa.event_hit_on_device_id_day(
    device_id text,
    year int,
    month int,
    day int,
    value bigint,
    PRIMARY KEY ((device_id), year, month, day)
) WITH CLUSTERING ORDER BY (device_id ASC, year DESC, month DESC, day DESC)

CREATE TABLE kaspa.event_hit_on_device_id_month(
    device_id text,
    year int,
    month int,
    value bigint,
    PRIMARY KEY ((device_id), year, month)
) WITH CLUSTERING ORDER BY (device_id ASC, year DESC, month DESC)

CREATE TABLE kaspa.event_hit_on_device_id_year(
    device_id text,
    year int,
    value bigint,
    PRIMARY KEY ((device_id), year)
) WITH CLUSTERING ORDER BY (device_id ASC, year DESC)

# SIGNATURE HIT COUNT AGGREGATE

CREATE TABLE kaspa.sign_hit_on_company_second(
    company text,
    key text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
    PRIMARY KEY ((company), key, year, month, day, hour, minute, second)
) WITH CLUSTERING ORDER BY (key ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC)

CREATE TABLE kaspa.sign_hit_on_company_minute(
    company text,
    key text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    PRIMARY KEY ((company), key, year, month, day, hour, minute)
) WITH CLUSTERING ORDER BY (key ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC)

CREATE TABLE kaspa.sign_hit_on_company_hour(
    company text,
    key text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((company), key, year, month, day, hour)
) WITH CLUSTERING ORDER BY (key ASC, year DESC, month DESC, day DESC, hour DESC)

CREATE TABLE kaspa.sign_hit_on_company_day(
    company text,
    key text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((company), key, year, month, day)
) WITH CLUSTERING ORDER BY (key ASC, year DESC, month DESC, day DESC)

CREATE TABLE kaspa.sign_hit_on_company_month(
    company text,
    key text,
    value bigint,
    year int,
    month int,
    PRIMARY KEY ((company), key, year, month)
) WITH CLUSTERING ORDER BY (key ASC, year DESC, month DESC)

CREATE TABLE kaspa.sign_hit_on_company_year(
    company text,
    key text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((company), key, year)
) WITH CLUSTERING ORDER BY (key ASC, year DESC)

CREATE TABLE kaspa.sign_hit_on_device_id_second(
    device_id text,
    key text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
    PRIMARY KEY ((device_id), key, year, month, day, hour, minute, second)
) WITH CLUSTERING ORDER BY (key ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC)

CREATE TABLE kaspa.sign_hit_on_device_id_minute(
    device_id text,
    key text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    PRIMARY KEY ((device_id), key, year, month, day, hour, minute)
) WITH CLUSTERING ORDER BY (key ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC)

CREATE TABLE kaspa.sign_hit_on_device_id_hour(
    device_id text,
    key text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((device_id), key, year, month, day, hour)
) WITH CLUSTERING ORDER BY (key ASC, year DESC, month DESC, day DESC, hour DESC)

CREATE TABLE kaspa.sign_hit_on_device_id_day(
    device_id text,
    key text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((device_id), key, year, month, day)
) WITH CLUSTERING ORDER BY (key ASC, year DESC, month DESC, day DESC)

CREATE TABLE kaspa.sign_hit_on_device_id_month(
    device_id text,
    key text,
    value bigint,
    year int,
    month int,
    PRIMARY KEY ((device_id), key, year, month)
) WITH CLUSTERING ORDER BY (key ASC, year DESC, month DESC)

CREATE TABLE kaspa.sign_hit_on_device_id_year(
    device_id text,
    key text,
    value bigint,
    year int,
    PRIMARY KEY ((device_id), key, year)
) WITH CLUSTERING ORDER BY (key ASC, year DESC)

# PROTOCOL RELATED AGGREGATION

CREATE TABLE kaspa.protocol_hit_on_company_second(
    company text,
    key text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
    PRIMARY KEY((company), key, year, month, day, hour, minute, second)
) WITH CLUSTERING ORDER BY (key ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC)

CREATE TABLE kaspa.protocol_hit_on_company_minute(
    company text,
    key text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    PRIMARY KEY ((company), key, year, month, day, hour, minute, second)
) WITH CLUSTERING ORDER BY (key ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC)

CREATE TABLE kaspa.protocol_hit_on_company_hour(
    company text,
    key text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((company), key, year, month, day, hour)
) WITH CLUSTERING ORDER BY (key ASC, year DESC, month DESC, day DESC, hour DESC)

CREATE TABLE kaspa.protocol_hit_on_company_day(
    company text,
    key text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((company), key, year, month, day)
) WITH CLUSTERING ORDER BY (key ASC, year DESC, month DESC, day DESC)

CREATE TABLE kaspa.protocol_hit_on_company_month(
    company text,
    key text,
    value bigint,
    year int,
    month int,
    PRIMARY KEY ((company), key, year, month)
) WITH CLUSTERING ORDER BY (key ASC, year DESC, month DESC)

CREATE TABLE kaspa.protocol_hit_on_company_year(
    company text,
    key text,
    value bigint,
    year int,
    PRIMARY KEY ((company), key, year)
) WITH CLUSTERING ORDER BY (key ASC, year DESC)

CREATE TABLE kaspa.protocol_hit_on_device_id_second(
    device_id text,
    key text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
    PRIMARY KEY((company), key, year, month, day, hour, minute, second)
) WITH CLUSTERING ORDER BY (key ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC)

CREATE TABLE kaspa.protocol_hit_on_device_id_minute(
    device_id text,
    key text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    PRIMARY KEY ((company), key, year, month, day, hour, minute, second)
) WITH CLUSTERING ORDER BY (key ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC)

CREATE TABLE kaspa.protocol_hit_on_device_id_hour(
    device_id text,
    key text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((company), key, year, month, day, hour)
) WITH CLUSTERING ORDER BY (key ASC, year DESC, month DESC, day DESC, hour DESC)

CREATE TABLE kaspa.protocol_hit_on_device_id_day(
    device_id text,
    key text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((company), key, year, month, day)
) WITH CLUSTERING ORDER BY (key ASC, year DESC, month DESC, day DESC)

CREATE TABLE kaspa.protocol_hit_on_device_id_month(
    device_id text,
    key text,
    value bigint,
    year int,
    month int,
    PRIMARY KEY ((company), key, year, month)
) WITH CLUSTERING ORDER BY (key ASC, year DESC, month DESC)

CREATE TABLE kaspa.protocol_hit_on_device_id_year(
    device_id text,
    key text,
    value bigint,
    year int,
    PRIMARY KEY ((company), key, year)
) WITH CLUSTERING ORDER BY (key ASC, year DESC)

CREATE TABLE kaspa.port_src_count_per_protocol_on_company_second(
    company text,
    protocol text,
    port_src text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
    PRIMARY KEY ((company, protocol), port_src, year, month, day, hour, minute, second)
) WITH CLUSTERING ORDER BY (port_src ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC)

CREATE TABLE kaspa.port_src_count_per_protocol_on_company_minute(
    company text,
    protocol text,
    port_src text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    PRIMARY KEY ((company, protocol), port_src, year, month, day, hour, minute)
) WITH CLUSTERING ORDER BY (port_src ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC)

CREATE TABLE kaspa.port_src_count_per_protocol_on_company_hour(
    company text,
    protocol text,
    port_src text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((company, protocol), port_src, year, month, day, hour)
) WITH CLUSTERING ORDER BY (port_src ASC, year DESC, month DESC, day DESC, hour DESC)

CREATE TABLE kaspa.port_src_count_per_protocol_on_company_day(
    company text,
    protocol text,
    port_src text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((company, protocol), port_src, year, month, day)
) WITH CLUSTERING ORDER BY (port_src ASC, year DESC, month DESC, day DESC)

CREATE TABLE kaspa.port_src_count_per_protocol_on_company_month(
    company text,
    protocol text,
    port_src text,
    value bigint,
    year int,
    month int,
    PRIMARY KEY ((company, protocol), port_src, year, month)
) WITH CLUSTERING ORDER BY (port_src ASC, year DESC, month DESC)

CREATE TABLE kaspa.port_src_count_per_protocol_on_company_year(
    company text,
    protocol text,
    port_src text,
    value bigint,
    year int,
    PRIMARY KEY ((company, protocol), port_src, year)
) WITH CLUSTERING ORDER BY (port_src ASC, year DESC)

CREATE TABLE kaspa.port_dest_count_per_protocol_on_company_second(
    company text,
    protocol text,
    port_dest text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
    PRIMARY KEY ((company, protocol), port_dest, year, month, day, hour, minute, second)
) WITH CLUSTERING ORDER BY (port_dest ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC)

CREATE TABLE kaspa.port_dest_count_per_protocol_on_company_minute(
    company text,
    protocol text,
    port_dest text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    PRIMARY KEY ((company, protocol), port_dest, year, month, day, hour, minute)
) WITH CLUSTERING ORDER BY (port_dest ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC)

CREATE TABLE kaspa.port_dest_count_per_protocol_on_company_hour(
    company text,
    protocol text,
    port_dest text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((company, protocol), port_dest, year, month, day, hour)
) WITH CLUSTERING ORDER BY (port_dest ASC, year DESC, month DESC, day DESC, hour DESC)

CREATE TABLE kaspa.port_dest_count_per_protocol_on_company_day(
    company text,
    protocol text,
    port_dest text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((company, protocol), port_dest, year, month, day)
) WITH CLUSTERING ORDER BY (port_dest ASC, year DESC, month DESC, day DESC)

CREATE TABLE kaspa.port_dest_count_per_protocol_on_company_month(
    company text,
    protocol text,
    port_dest text,
    value bigint,
    year int,
    month int,
    PRIMARY KEY ((company, protocol), port_dest, year, month)
) WITH CLUSTERING ORDER BY (port_dest ASC, year DESC, month DESC)

CREATE TABLE kaspa.port_dest_count_per_protocol_on_company_year(
    company text,
    protocol text,
    port_dest text,
    value bigint,
    year int,
    PRIMARY KEY ((company, protocol), port_dest, year)
) WITH CLUSTERING ORDER BY (port_dest ASC, year DESC)

CREATE TABLE kaspa.port_src_count_per_protocol_on_device_id_second(
    device_id text,
    protocol text,
    port_src text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
    PRIMARY KEY ((device_id, protocol), port_src, year, month, day, hour, minute, second)
) WITH CLUSTERING ORDER BY (port_src ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC)

CREATE TABLE kaspa.port_src_count_per_protocol_on_device_id_minute(
    device_id text,
    protocol text,
    port_src text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    PRIMARY KEY ((device_id, protocol), port_src, year, month, day, hour, minute)
) WITH CLUSTERING ORDER BY (port_src ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC)

CREATE TABLE kaspa.port_src_count_per_protocol_on_device_id_hour(
    device_id text,
    protocol text,
    port_src text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((device_id, protocol), port_src, year, month, day, hour)
) WITH CLUSTERING ORDER BY (port_src ASC, year DESC, month DESC, day DESC, hour DESC)

CREATE TABLE kaspa.port_src_count_per_protocol_on_device_id_day(
    device_id text,
    protocol text,
    port_src text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((device_id, protocol), port_src, year, month, day)
) WITH CLUSTERING ORDER BY (port_src ASC, year DESC, month DESC, day DESC)

CREATE TABLE kaspa.port_src_count_per_protocol_on_device_id_month(
    device_id text,
    protocol text,
    port_src text,
    value bigint,
    year int,
    month int,
    PRIMARY KEY ((device_id, protocol), port_src, year, month)
) WITH CLUSTERING ORDER BY (port_src ASC, year DESC, month DESC)

CREATE TABLE kaspa.port_src_count_per_protocol_on_device_id_year(
    device_id text,
    protocol text,
    port_src text,
    value bigint,
    year int,
    PRIMARY KEY ((device_id, protocol), port_src, year)
) WITH CLUSTERING ORDER BY (port_src ASC, year DESC)

CREATE TABLE kaspa.port_dest_count_per_protocol_on_device_id_second(
    device_id text,
    protocol text,
    port_dest text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
    PRIMARY KEY ((device_id, protocol), port_dest, year, month, day, hour, minute, second)
) WITH CLUSTERING ORDER BY (port_dest ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC)

CREATE TABLE kaspa.port_dest_count_per_protocol_on_device_id_minute(
    device_id text,
    protocol text,
    port_dest text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    PRIMARY KEY ((device_id, protocol), port_dest, year, month, day, hour, minute)
) WITH CLUSTERING ORDER BY (port_dest ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC)

CREATE TABLE kaspa.port_dest_count_per_protocol_on_device_id_hour(
    device_id text,
    protocol text,
    port_dest text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((device_id, protocol), port_dest, year, month, day, hour)
) WITH CLUSTERING ORDER BY (port_dest ASC, year DESC, month DESC, day DESC, hour DESC)

CREATE TABLE kaspa.port_dest_count_per_protocol_on_device_id_day(
    device_id text,
    protocol text,
    port_dest text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((device_id, protocol), port_dest, year, month, day)
) WITH CLUSTERING ORDER BY (port_dest ASC, year DESC, month DESC, day DESC)

CREATE TABLE kaspa.port_dest_count_per_protocol_on_device_id_month(
    device_id text,
    protocol text,
    port_dest text,
    value bigint,
    year int,
    month int,
    PRIMARY KEY ((device_id, protocol), port_dest, year, month)
) WITH CLUSTERING ORDER BY (port_dest ASC, year DESC, month DESC)

CREATE TABLE kaspa.port_dest_count_per_protocol_on_device_id_year(
    device_id text,
    protocol text,
    port_dest text,
    value bigint,
    year int,
    PRIMARY KEY ((device_id, protocol), port_dest, year)
) WITH CLUSTERING ORDER BY (port_dest ASC, year DESC)

# IP RELATED AGGREGATED

CREATE TABLE kaspa.ip_source_count_on_company_second(
    company text,
    ip_source text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
    PRIMARY KEY ((company), ip_source, year, month, day, hour, minute, second)
) WITH CLUSTERING ORDER BY (ip_source ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC)

CREATE TABLE kaspa.ip_source_count_on_company_minute(
    company text,
    ip_source text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    PRIMARY KEY ((company), ip_source, year, month, day, hour, minute)
) WITH CLUSTERING ORDER BY (ip_source ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC)

CREATE TABLE kaspa.ip_source_count_on_company_hour(
    company text,
    ip_source text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((company), ip_source, year, month, day, hour)
) WITH CLUSTERING ORDER BY (ip_source ASC, year DESC, month DESC, day DESC, hour DESC)

CREATE TABLE kaspa.ip_source_count_on_company_day(
    company text,
    ip_source text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((company), ip_source, year, month, day)
) WITH CLUSTERING ORDER BY (ip_source ASC, year DESC, month DESC, day DESC)

CREATE TABLE kaspa.ip_source_count_on_company_month(
    company text,
    ip_source text,
    country text,
    value bigint,
    year int,
    month int,
    PRIMARY KEY ((company), ip_source, year, month)
) WITH CLUSTERING ORDER BY (ip_source ASC, year DESC, month DESC)

CREATE TABLE kaspa.ip_source_count_on_company_year(
    company text,
    ip_source text,
    country text,
    value bigint,
    year int,
    PRIMARY KEY ((company), ip_source, year)
) WITH CLUSTERING ORDER BY (ip_source ASC, year DESC)

CREATE TABLE kaspa.ip_source_count_on_device_id_second(
    device_id text,
    ip_source text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
    PRIMARY KEY ((device_id), ip_source, year, month, day, hour, minute, second)
) WITH CLUSTERING ORDER BY (ip_source ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC)

CREATE TABLE kaspa.ip_source_count_on_device_id_minute(
    device_id text,
    ip_source text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    PRIMARY KEY ((device_id), ip_source, year, month, day, hour, minute)
) WITH CLUSTERING ORDER BY (ip_source ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC)

CREATE TABLE kaspa.ip_source_count_on_device_id_hour(
    device_id text,
    ip_source text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((device_id), ip_source, year, month, day, hour)
) WITH CLUSTERING ORDER BY (ip_source ASC, year DESC, month DESC, day DESC, hour DESC)

CREATE TABLE kaspa.ip_source_count_on_device_id_day(
    device_id text,
    ip_source text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((device_id), ip_source, year, month, day)
) WITH CLUSTERING ORDER BY (ip_source ASC, year DESC, month DESC, day DESC)

CREATE TABLE kaspa.ip_source_count_on_device_id_month(
    device_id text,
    ip_source text,
    country text,
    value bigint,
    year int,
    month int,
    PRIMARY KEY ((device_id), ip_source, year, month)
) WITH CLUSTERING ORDER BY (ip_source ASC, year DESC, month DESC)

CREATE TABLE kaspa.ip_source_count_on_device_id_year(
    device_id text,
    ip_source text,
    country text,
    value bigint,
    year int,
    PRIMARY KEY ((device_id), ip_source, year)
) WITH CLUSTERING ORDER BY (ip_source ASC, year DESC)

CREATE TABLE kaspa.ip_dest_count_on_company_second(
    company text,
    ip_dest text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
    PRIMARY KEY ((company), ip_dest, year, month, day, hour, minute, second)
) WITH CLUSTERING ORDER BY (ip_dest ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC)

CREATE TABLE kaspa.ip_dest_count_on_company_minute(
    company text,
    ip_dest text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    PRIMARY KEY ((company), ip_dest, year, month, day, hour, minute)
) WITH CLUSTERING ORDER BY (ip_dest ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC)

CREATE TABLE kaspa.ip_dest_count_on_company_hour(
    company text,
    ip_dest text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((company), ip_dest, year, month, day, hour)
) WITH CLUSTERING ORDER BY (ip_dest ASC, year DESC, month DESC, day DESC, hour DESC)

CREATE TABLE kaspa.ip_dest_count_on_company_day(
    company text,
    ip_dest text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((company), ip_dest, year, month, day)
) WITH CLUSTERING ORDER BY (ip_dest ASC, year DESC, month DESC, day DESC)

CREATE TABLE kaspa.ip_dest_count_on_company_month(
    company text,
    ip_dest text,
    country text,
    value bigint,
    year int,
    month int,
    PRIMARY KEY ((company), ip_dest, year, month)
) WITH CLUSTERING ORDER BY (ip_dest ASC, year DESC, month DESC)

CREATE TABLE kaspa.ip_dest_count_on_company_year(
    company text,
    ip_dest text,
    country text,
    value bigint,
    year int,
    PRIMARY KEY ((company), ip_dest, year)
) WITH CLUSTERING ORDER BY (ip_dest ASC, year DESC)

CREATE TABLE kaspa.ip_dest_count_on_device_id_second(
    device_id text,
    ip_dest text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
    PRIMARY KEY ((device_id), ip_dest, year, month, day, hour, minute, second)
) WITH CLUSTERING ORDER BY (ip_dest ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC)

CREATE TABLE kaspa.ip_dest_count_on_device_id_minute(
    device_id text,
    ip_dest text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    PRIMARY KEY ((device_id), ip_dest, year, month, day, hour, minute)
) WITH CLUSTERING ORDER BY (ip_dest ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC)

CREATE TABLE kaspa.ip_dest_count_on_device_id_hour(
    device_id text,
    ip_dest text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((device_id), ip_dest, year, month, day, hour)
) WITH CLUSTERING ORDER BY (ip_dest ASC, year DESC, month DESC, day DESC, hour DESC)

CREATE TABLE kaspa.ip_dest_count_on_device_id_day(
    device_id text,
    ip_dest text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((device_id), ip_dest, year, month, day)
) WITH CLUSTERING ORDER BY (ip_dest ASC, year DESC, month DESC, day DESC)

CREATE TABLE kaspa.ip_dest_count_on_device_id_month(
    device_id text,
    ip_dest text,
    country text,
    value bigint,
    year int,
    month int,
    PRIMARY KEY ((device_id), ip_dest, year, month)
) WITH CLUSTERING ORDER BY (ip_dest ASC, year DESC, month DESC)

CREATE TABLE kaspa.ip_dest_count_on_device_id_year(
    device_id text,
    ip_dest text,
    country text,
    value bigint,
    year int,
    PRIMARY KEY ((device_id), ip_dest, year)
) WITH CLUSTERING ORDER BY (ip_dest ASC, year DESC)

CREATE TABLE kaspa.src_country_on_device_company_second(
    company text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
    PRIMARY KEY ((company), country, year, month, day, hour, minute, second)
) WITH CLUSTERING ORDER BY (country ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC)

CREATE TABLE kaspa.src_country_on_device_company_minute(
    company text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    PRIMARY KEY ((company), country, year, month, day, hour, minute)
) WITH CLUSTERING ORDER BY (country ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC)

CREATE TABLE kaspa.src_country_on_device_company_hour(
    company text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((company), country, year, month, day, hour)
) WITH CLUSTERING ORDER BY (country ASC, year DESC, month DESC, day DESC, hour DESC)

CREATE TABLE kaspa.src_country_on_device_company_day(
    company text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((company), country, year, month, day)
) WITH CLUSTERING ORDER BY (country ASC, year DESC, month DESC, day DESC)

CREATE TABLE kaspa.src_country_on_device_company_month(
    company text,
    country text,
    value bigint,
    year int,
    month int,
    PRIMARY KEY ((company), country, year, month)
) WITH CLUSTERING ORDER BY (country ASC, year DESC, month DESC)

CREATE TABLE kaspa.src_country_on_device_company_year(
    company text,
    country text,
    value bigint,
    year int,
    PRIMARY KEY ((company), country, year)
) WITH CLUSTERING ORDER BY (country ASC, year DESC)