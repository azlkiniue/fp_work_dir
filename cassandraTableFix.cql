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
    id uuid,
    company text,
    device_id text,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
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
    dst_country text,
    PRIMARY KEY ((device_id), year, month, day, hour, minute, second, id)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC, id DESC)

CREATE TABLE kaspa.raw_data_by_company(
    id uuid,
    company text,
    device_id text,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
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
    dst_country text,
    PRIMARY KEY ((company), device_id, year, month, day, hour, minute, second, id)
) WITH CLUSTERING ORDER BY (device_id ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC)

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
    value bigint,
    PRIMARY KEY ((company), year, month, day, hour, minute, second)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC)

CREATE TABLE kaspa.event_hit_on_company_minute(
    company text,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    value bigint,
    PRIMARY KEY ((company), year, month, day, hour, minute)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC)

CREATE TABLE kaspa.event_hit_on_company_hour(
    company text,
    year int,
    month int,
    day int,
    hour int,
    value bigint,
    PRIMARY KEY ((company), year, month, day, hour)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC)

CREATE TABLE kaspa.event_hit_on_company_day(
    company text,
    year int,
    month int,
    day int,
    value bigint,
    PRIMARY KEY ((company), year, month, day)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC)

CREATE TABLE kaspa.event_hit_on_company_month(
    company text,
    year int,
    month int,
    value bigint, 
    PRIMARY KEY ((company), year, month)
) WITH CLUSTERING ORDER BY (year DESC, month DESC)

CREATE TABLE kaspa.event_hit_on_company_year(
    company text,
    year int,
    value bigint, 
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
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC)

CREATE TABLE kaspa.event_hit_on_device_id_min(
    device_id text,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    value bigint,
    PRIMARY KEY ((device_id), year, month, day, hour, minute)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC)

CREATE TABLE kaspa.event_hit_on_device_id_hour(
    device_id text,
    year int,
    month int,
    day int,
    hour int,
    value bigint,
    PRIMARY KEY ((device_id), year, month, day, hour)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC)

CREATE TABLE kaspa.event_hit_on_device_id_day(
    device_id text,
    year int,
    month int,
    day int,
    value bigint,
    PRIMARY KEY ((device_id), year, month, day)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC)

CREATE TABLE kaspa.event_hit_on_device_id_month(
    device_id text,
    year int,
    month int,
    value bigint,
    PRIMARY KEY ((device_id), year, month)
) WITH CLUSTERING ORDER BY (year DESC, month DESC)

CREATE TABLE kaspa.event_hit_on_device_id_year(
    device_id text,
    year int,
    value bigint,
    PRIMARY KEY ((device_id), year)
) WITH CLUSTERING ORDER BY (year DESC)

# SIGNATURE HIT COUNT AGGREGATE

CREATE TABLE kaspa.signature_hit_on_company_sec(
    company text,
    alert_msg text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
    PRIMARY KEY ((company), year, month, day, hour, minute, second, alert_msg)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC, alert_msg ASC)

CREATE TABLE kaspa.signature_hit_on_company_min(
    company text,
    alert_msg text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    PRIMARY KEY ((company), year, month, day, hour, minute, alert_msg)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, alert_msg ASC)

CREATE TABLE kaspa.signature_hit_on_company_hour(
    company text,
    alert_msg text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((company), year, month, day, hour, alert_msg)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, alert_msg ASC)

CREATE TABLE kaspa.signature_hit_on_company_day(
    company text,
    alert_msg text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((company), year, month, day, alert_msg)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, alert_msg ASC)

CREATE TABLE kaspa.signature_hit_on_company_month(
    company text,
    alert_msg text,
    value bigint,
    year int,
    month int,
    PRIMARY KEY ((company), key, year, month, alert_msg)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, alert_msg ASC)

CREATE TABLE kaspa.signature_hit_on_company_year(
    company text,
    alert_msg text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((company), key, year, alert_msg)
) WITH CLUSTERING ORDER BY (year DESC, alert_msg ASC)

CREATE TABLE kaspa.signature_hit_on_device_id_sec(
    device_id text,
    alert_msg text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
    PRIMARY KEY ((device_id), year, month, day, hour, minute, second, alert_msg)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC, alert_msg ASC)

CREATE TABLE kaspa.signature_hit_on_device_id_min(
    device_id text,
    alert_msg text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    PRIMARY KEY ((device_id), year, month, day, hour, minute, alert_msg)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, alert_msg ASC)

CREATE TABLE kaspa.signature_hit_on_device_id_hour(
    device_id text,
    alert_msg text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((device_id), year, month, day, hour, alert_msg)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, alert_msg ASC)

CREATE TABLE kaspa.signature_hit_on_device_id_day(
    device_id text,
    alert_msg text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((device_id), year, month, day, alert_msg)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, alert_msg ASC)

CREATE TABLE kaspa.signature_hit_on_device_id_month(
    device_id text,
    alert_msg text,
    value bigint,
    year int,
    month int,
    PRIMARY KEY ((device_id), year, month, alert_msg)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, alert_msg ASC)

CREATE TABLE kaspa.signature_hit_on_device_id_year(
    device_id text,
    alert_msg text,
    value bigint,
    year int,
    PRIMARY KEY ((device_id), year, alert_msg)
) WITH CLUSTERING ORDER BY (year DESC, alert_msg ASC)

# PROTOCOL RELATED AGGREGATION

CREATE TABLE kaspa.protocol_hit_on_company_second(
    company text,
    protocol text,
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
    protocol text,
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
    protocol text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((company), key, year, month, day, hour)
) WITH CLUSTERING ORDER BY (key ASC, year DESC, month DESC, day DESC, hour DESC)

CREATE TABLE kaspa.protocol_hit_on_company_day(
    company text,
    protocol text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((company), key, year, month, day)
) WITH CLUSTERING ORDER BY (key ASC, year DESC, month DESC, day DESC)

CREATE TABLE kaspa.protocol_hit_on_company_month(
    company text,
    protocol text,
    value bigint,
    year int,
    month int,
    PRIMARY KEY ((company), key, year, month)
) WITH CLUSTERING ORDER BY (key ASC, year DESC, month DESC)

CREATE TABLE kaspa.protocol_hit_on_company_year(
    company text,
    protocol text,
    value bigint,
    year int,
    PRIMARY KEY ((company), key, year)
) WITH CLUSTERING ORDER BY (key ASC, year DESC)

CREATE TABLE kaspa.protocol_hit_on_device_id_second(
    device_id text,
    protocol text,
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
    protocol text,
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
    protocol text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((company), key, year, month, day, hour)
) WITH CLUSTERING ORDER BY (key ASC, year DESC, month DESC, day DESC, hour DESC)

CREATE TABLE kaspa.protocol_hit_on_device_id_day(
    device_id text,
    protocol text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((company), key, year, month, day)
) WITH CLUSTERING ORDER BY (key ASC, year DESC, month DESC, day DESC)

CREATE TABLE kaspa.protocol_hit_on_device_id_month(
    device_id text,
    protocol text,
    value bigint,
    year int,
    month int,
    PRIMARY KEY ((company), key, year, month)
) WITH CLUSTERING ORDER BY (key ASC, year DESC, month DESC)

CREATE TABLE kaspa.protocol_hit_on_device_id_year(
    device_id text,
    protocol text,
    value bigint,
    year int,
    PRIMARY KEY ((company), key, year)
) WITH CLUSTERING ORDER BY (key ASC, year DESC)

CREATE TABLE kaspa.src_port_count_per_protocol_on_company_second(
    company text,
    protocol text,
    src_port text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
    PRIMARY KEY ((company, protocol), src_port, year, month, day, hour, minute, second)
) WITH CLUSTERING ORDER BY (src_port ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC)

CREATE TABLE kaspa.src_port_count_per_protocol_on_company_minute(
    company text,
    protocol text,
    src_port text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    PRIMARY KEY ((company, protocol), src_port, year, month, day, hour, minute)
) WITH CLUSTERING ORDER BY (src_port ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC)

CREATE TABLE kaspa.src_port_count_per_protocol_on_company_hour(
    company text,
    protocol text,
    src_port text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((company, protocol), src_port, year, month, day, hour)
) WITH CLUSTERING ORDER BY (src_port ASC, year DESC, month DESC, day DESC, hour DESC)

CREATE TABLE kaspa.src_port_count_per_protocol_on_company_day(
    company text,
    protocol text,
    src_port text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((company, protocol), src_port, year, month, day)
) WITH CLUSTERING ORDER BY (src_port ASC, year DESC, month DESC, day DESC)

CREATE TABLE kaspa.src_port_count_per_protocol_on_company_month(
    company text,
    protocol text,
    src_port text,
    value bigint,
    year int,
    month int,
    PRIMARY KEY ((company, protocol), src_port, year, month)
) WITH CLUSTERING ORDER BY (src_port ASC, year DESC, month DESC)

CREATE TABLE kaspa.src_port_count_per_protocol_on_company_year(
    company text,
    protocol text,
    src_port text,
    value bigint,
    year int,
    PRIMARY KEY ((company, protocol), src_port, year)
) WITH CLUSTERING ORDER BY (src_port ASC, year DESC)

CREATE TABLE kaspa.dst_port_count_per_protocol_on_company_second(
    company text,
    protocol text,
    dst_port text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
    PRIMARY KEY ((company, protocol), dst_port, year, month, day, hour, minute, second)
) WITH CLUSTERING ORDER BY (dst_port ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC)

CREATE TABLE kaspa.dst_port_count_per_protocol_on_company_minute(
    company text,
    protocol text,
    dst_port text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    PRIMARY KEY ((company, protocol), dst_port, year, month, day, hour, minute)
) WITH CLUSTERING ORDER BY (dst_port ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC)

CREATE TABLE kaspa.dst_port_count_per_protocol_on_company_hour(
    company text,
    protocol text,
    dst_port text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((company, protocol), dst_port, year, month, day, hour)
) WITH CLUSTERING ORDER BY (dst_port ASC, year DESC, month DESC, day DESC, hour DESC)

CREATE TABLE kaspa.dst_port_count_per_protocol_on_company_day(
    company text,
    protocol text,
    dst_port text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((company, protocol), dst_port, year, month, day)
) WITH CLUSTERING ORDER BY (dst_port ASC, year DESC, month DESC, day DESC)

CREATE TABLE kaspa.dst_port_count_per_protocol_on_company_month(
    company text,
    protocol text,
    dst_port text,
    value bigint,
    year int,
    month int,
    PRIMARY KEY ((company, protocol), dst_port, year, month)
) WITH CLUSTERING ORDER BY (dst_port ASC, year DESC, month DESC)

CREATE TABLE kaspa.dst_port_count_per_protocol_on_company_year(
    company text,
    protocol text,
    dst_port text,
    value bigint,
    year int,
    PRIMARY KEY ((company, protocol), dst_port, year)
) WITH CLUSTERING ORDER BY (dst_port ASC, year DESC)

CREATE TABLE kaspa.src_port_count_per_protocol_on_device_id_second(
    device_id text,
    protocol text,
    src_port text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
    PRIMARY KEY ((device_id, protocol), src_port, year, month, day, hour, minute, second)
) WITH CLUSTERING ORDER BY (src_port ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC)

CREATE TABLE kaspa.src_port_count_per_protocol_on_device_id_minute(
    device_id text,
    protocol text,
    src_port text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    PRIMARY KEY ((device_id, protocol), src_port, year, month, day, hour, minute)
) WITH CLUSTERING ORDER BY (src_port ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC)

CREATE TABLE kaspa.src_port_count_per_protocol_on_device_id_hour(
    device_id text,
    protocol text,
    src_port text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((device_id, protocol), src_port, year, month, day, hour)
) WITH CLUSTERING ORDER BY (src_port ASC, year DESC, month DESC, day DESC, hour DESC)

CREATE TABLE kaspa.src_port_count_per_protocol_on_device_id_day(
    device_id text,
    protocol text,
    src_port text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((device_id, protocol), src_port, year, month, day)
) WITH CLUSTERING ORDER BY (src_port ASC, year DESC, month DESC, day DESC)

CREATE TABLE kaspa.src_port_count_per_protocol_on_device_id_month(
    device_id text,
    protocol text,
    src_port text,
    value bigint,
    year int,
    month int,
    PRIMARY KEY ((device_id, protocol), src_port, year, month)
) WITH CLUSTERING ORDER BY (src_port ASC, year DESC, month DESC)

CREATE TABLE kaspa.src_port_count_per_protocol_on_device_id_year(
    device_id text,
    protocol text,
    src_port text,
    value bigint,
    year int,
    PRIMARY KEY ((device_id, protocol), src_port, year)
) WITH CLUSTERING ORDER BY (src_port ASC, year DESC)

CREATE TABLE kaspa.dst_port_count_per_protocol_on_device_id_second(
    device_id text,
    protocol text,
    dst_port text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
    PRIMARY KEY ((device_id, protocol), dst_port, year, month, day, hour, minute, second)
) WITH CLUSTERING ORDER BY (dst_port ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC)

CREATE TABLE kaspa.dst_port_count_per_protocol_on_device_id_minute(
    device_id text,
    protocol text,
    dst_port text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    PRIMARY KEY ((device_id, protocol), dst_port, year, month, day, hour, minute)
) WITH CLUSTERING ORDER BY (dst_port ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC)

CREATE TABLE kaspa.dst_port_count_per_protocol_on_device_id_hour(
    device_id text,
    protocol text,
    dst_port text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((device_id, protocol), dst_port, year, month, day, hour)
) WITH CLUSTERING ORDER BY (dst_port ASC, year DESC, month DESC, day DESC, hour DESC)

CREATE TABLE kaspa.dst_port_count_per_protocol_on_device_id_day(
    device_id text,
    protocol text,
    dst_port text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((device_id, protocol), dst_port, year, month, day)
) WITH CLUSTERING ORDER BY (dst_port ASC, year DESC, month DESC, day DESC)

CREATE TABLE kaspa.dst_port_count_per_protocol_on_device_id_month(
    device_id text,
    protocol text,
    dst_port text,
    value bigint,
    year int,
    month int,
    PRIMARY KEY ((device_id, protocol), dst_port, year, month)
) WITH CLUSTERING ORDER BY (dst_port ASC, year DESC, month DESC)

CREATE TABLE kaspa.dst_port_count_per_protocol_on_device_id_year(
    device_id text,
    protocol text,
    dst_port text,
    value bigint,
    year int,
    PRIMARY KEY ((device_id, protocol), dst_port, year)
) WITH CLUSTERING ORDER BY (dst_port ASC, year DESC)

# IP RELATED AGGREGATED

CREATE TABLE 

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
    PRIMARY KEY ((company), year, month, day, hour, minute, second, ip_source)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC, ip_source ASC)

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
    PRIMARY KEY ((company), year, month, day, hour, minute, ip_source)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, ip_source ASC)

CREATE TABLE kaspa.ip_source_count_on_company_hour(
    company text,
    ip_source text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((company), year, month, day, hour, ip_source)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, ip_source ASC)

CREATE TABLE kaspa.ip_source_count_on_company_day(
    company text,
    ip_source text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((company), year, month, day, ip_source)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, ip_source ASC)

CREATE TABLE kaspa.ip_source_count_on_company_month(
    company text,
    ip_source text,
    country text,
    value bigint,
    year int,
    month int,
    PRIMARY KEY ((company), year, month, ip_source)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, ip_source ASC)

CREATE TABLE kaspa.ip_source_count_on_company_year(
    company text,
    ip_source text,
    country text,
    value bigint,
    year int,
    PRIMARY KEY ((company), year, ip_source)
) WITH CLUSTERING ORDER BY (year DESC, ip_source ASC)

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
    PRIMARY KEY ((device_id), year, month, day, hour, minute, second, ip_source)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC, ip_source ASC)

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
    PRIMARY KEY ((device_id),year, month, day, hour, minute, ip_source)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, ip_source ASC)

CREATE TABLE kaspa.ip_source_count_on_device_id_hour(
    device_id text,
    ip_source text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((device_id), year, month, day, hour, ip_source)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, ip_source ASC)

CREATE TABLE kaspa.ip_source_count_on_device_id_day(
    device_id text,
    ip_source text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((device_id), year, month, day, ip_source)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, ip_source AS)

CREATE TABLE kaspa.ip_source_count_on_device_id_month(
    device_id text,
    ip_source text,
    country text,
    value bigint,
    year int,
    month int,
    PRIMARY KEY ((device_id), year, month, ip_source)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, ip_source ASC)

CREATE TABLE kaspa.ip_source_count_on_device_id_year(
    device_id text,
    ip_source text,
    country text,
    value bigint,
    year int,
    PRIMARY KEY ((device_id), year, ip_source)
) WITH CLUSTERING ORDER BY (year DESC, ip_source ASC)

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