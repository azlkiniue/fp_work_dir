DROP KEYSPACE IF EXISTS kaspa;
CREATE KEYSPACE kaspa WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};

USE kaspa;

DROP TABLE IF EXISTS kaspa.sensor_by_company
DROP TABLE IF EXISTS kaspa.sensor_by_device_id

DROP TABLE IF EXISTS kaspa.raw_data_by_device_id
DROP TABLE IF EXISTS kaspa.raw_data_by_company

DROP TABLE IF EXISTS kaspa.user_by_username
DROP TABLE IF EXISTS kaspa.user_by_company
DROP TABLE IF EXISTS kaspa.list_user_by_group

DROP TABLE IF EXISTS kaspa.event_hit_on_company_sec
DROP TABLE IF EXISTS kaspa.event_hit_on_company_minute
DROP TABLE IF EXISTS kaspa.event_hit_on_company_hour
DROP TABLE IF EXISTS kaspa.event_hit_on_company_day

DROP TABLE IF EXISTS kaspa.event_hit_on_device_id_sec
DROP TABLE IF EXISTS kaspa.event_hit_on_device_id_min
DROP TABLE IF EXISTS kaspa.event_hit_on_device_id_hour
DROP TABLE IF EXISTS kaspa.event_hit_on_device_id_day

DROP TABLE IF EXISTS kaspa.signature_hit_on_company_sec
DROP TABLE IF EXISTS kaspa.signature_hit_on_company_minute
DROP TABLE IF EXISTS kaspa.signature_hit_on_company_hour
DROP TABLE IF EXISTS kaspa.signature_hit_on_company_day

DROP TABLE IF EXISTS kaspa.signature_hit_on_device_id_sec
DROP TABLE IF EXISTS kaspa.signature_hit_on_device_id_minute
DROP TABLE IF EXISTS kaspa.signature_hit_on_device_id_hour
DROP TABLE IF EXISTS kaspa.signature_hit_on_device_id_day

DROP TABLE IF EXISTS kaspa.protocol_hit_on_company_second
DROP TABLE IF EXISTS kaspa.protocol_hit_on_company_minute
DROP TABLE IF EXISTS kaspa.protocol_hit_on_company_hour
DROP TABLE IF EXISTS kaspa.protocol_hit_on_company_day

DROP TABLE IF EXISTS kaspa.protocol_hit_on_device_id_second
DROP TABLE IF EXISTS kaspa.protocol_hit_on_device_id_minute
DROP TABLE IF EXISTS kaspa.protocol_hit_on_device_id_hour
DROP TABLE IF EXISTS kaspa.protocol_hit_on_device_id_day

DROP TABLE IF EXISTS kaspa.protocol_by_sport_hit_on_company_second
DROP TABLE IF EXISTS kaspa.protocol_by_sport_hit_on_company_minute
DROP TABLE IF EXISTS kaspa.protocol_by_sport_hit_on_company_hour
DROP TABLE IF EXISTS kaspa.protocol_by_sport_hit_on_company_day

DROP TABLE IF EXISTS kaspa.protocol_by_dport_hit_on_company_second
DROP TABLE IF EXISTS kaspa.protocol_by_dport_hit_on_company_minute
DROP TABLE IF EXISTS kaspa.protocol_by_dport_hit_on_company_hour
DROP TABLE IF EXISTS kaspa.protocol_by_dport_hit_on_company_day

DROP TABLE IF EXISTS kaspa.protocol_by_sport_hit_on_device_id_second
DROP TABLE IF EXISTS kaspa.protocol_by_sport_hit_on_device_id_minute
DROP TABLE IF EXISTS kaspa.protocol_by_sport_hit_on_device_id_hour
DROP TABLE IF EXISTS kaspa.protocol_by_sport_hit_on_device_id_day

DROP TABLE IF EXISTS kaspa.protocol_by_dport_hit_on_device_id_second
DROP TABLE IF EXISTS kaspa.protocol_by_dport_hit_on_device_id_minute
DROP TABLE IF EXISTS kaspa.protocol_by_dport_hit_on_device_id_hour
DROP TABLE IF EXISTS kaspa.protocol_by_dport_hit_on_device_id_day

DROP TABLE IF EXISTS kaspa.ip_source_hit_on_company_sec
DROP TABLE IF EXISTS kaspa.ip_source_hit_on_company_minute
DROP TABLE IF EXISTS kaspa.ip_source_hit_on_company_hour
DROP TABLE IF EXISTS kaspa.ip_source_hit_on_company_day

DROP TABLE IF EXISTS kaspa.ip_dest_hit_on_company_sec
DROP TABLE IF EXISTS kaspa.ip_dest_hit_on_company_minute
DROP TABLE IF EXISTS kaspa.ip_dest_hit_on_company_hour
DROP TABLE IF EXISTS kaspa.ip_dest_hit_on_company_day

DROP TABLE IF EXISTS kaspa.ip_source_hit_on_device_id_sec
DROP TABLE IF EXISTS kaspa.ip_source_hit_on_device_id_minute
DROP TABLE IF EXISTS kaspa.ip_source_hit_on_device_id_hour
DROP TABLE IF EXISTS kaspa.ip_source_hit_on_device_id_day

DROP TABLE IF EXISTS kaspa.ip_dest_hit_on_device_id_sec
DROP TABLE IF EXISTS kaspa.ip_dest_hit_on_device_id_minute
DROP TABLE IF EXISTS kaspa.ip_dest_hit_on_device_id_hour
DROP TABLE IF EXISTS kaspa.ip_dest_hit_on_device_id_day

DROP TABLE IF EXISTS kaspa.country_source_hit_on_company_second
DROP TABLE IF EXISTS kaspa.country_source_hit_on_company_minute
DROP TABLE IF EXISTS kaspa.country_source_hit_on_company_hour
DROP TABLE IF EXISTS kaspa.country_source_hit_on_company_day

DROP TABLE IF EXISTS kaspa.country_dest_hit_on_company_second
DROP TABLE IF EXISTS kaspa.country_dest_hit_on_company_minute
DROP TABLE IF EXISTS kaspa.country_dest_hit_on_company_hour
DROP TABLE IF EXISTS kaspa.country_dest_hit_on_company_day

DROP TABLE IF EXISTS kaspa.country_source_hit_on_device_id_second
DROP TABLE IF EXISTS kaspa.country_source_hit_on_device_id_minute
DROP TABLE IF EXISTS kaspa.country_source_hit_on_device_id_hour
DROP TABLE IF EXISTS kaspa.country_source_hit_on_device_id_day

DROP TABLE IF EXISTS kaspa.country_dest_hit_on_device_id_second
DROP TABLE IF EXISTS kaspa.country_dest_hit_on_device_id_minute
DROP TABLE IF EXISTS kaspa.country_dest_hit_on_device_id_hour
DROP TABLE IF EXISTS kaspa.country_dest_hit_on_device_id_day









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
) WITH CLUSTERING ORDER BY (device_id ASC);

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
) WITH CLUSTERING ORDER BY (company ASC);





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
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC, id DESC);

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
) WITH CLUSTERING ORDER BY (device_id ASC, year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC);





CREATE TABLE kaspa.user_by_username(
    username text,
    email text,
    password_hash text,
    api_key text,
    token text,
    group text,
    time_joined timestamp,
    PRIMARY KEY (username)
);

CREATE TABLE kaspa.user_by_company(
    username text,
    email text,
    password_hash text,
    api_key text,
    token text,
    group text,
    time_joined timestamp,
    PRIMARY KEY (company)
);

CREATE TABLE kaspa.list_user_by_group(
    username text,
    email text,
    password_hash text,
    api_key text,
    token text,
    group text,
    time_joined timestamp,
    PRIMARY KEY (group, username)
) WITH CLUSTERING ORDER BY (username ASC);





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
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC);

CREATE TABLE kaspa.event_hit_on_company_minute(
    company text,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    value bigint,
    PRIMARY KEY ((company), year, month, day, hour, minute)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC);

CREATE TABLE kaspa.event_hit_on_company_hour(
    company text,
    year int,
    month int,
    day int,
    hour int,
    value bigint,
    PRIMARY KEY ((company), year, month, day, hour)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC);

CREATE TABLE kaspa.event_hit_on_company_day(
    company text,
    year int,
    month int,
    day int,
    value bigint,
    PRIMARY KEY ((company), year, month, day)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC);



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
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC);

CREATE TABLE kaspa.event_hit_on_device_id_min(
    device_id text,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    value bigint,
    PRIMARY KEY ((device_id), year, month, day, hour, minute)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC);

CREATE TABLE kaspa.event_hit_on_device_id_hour(
    device_id text,
    year int,
    month int,
    day int,
    hour int,
    value bigint,
    PRIMARY KEY ((device_id), year, month, day, hour)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC);

CREATE TABLE kaspa.event_hit_on_device_id_day(
    device_id text,
    year int,
    month int,
    day int,
    value bigint,
    PRIMARY KEY ((device_id), year, month, day)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC);



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
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC, alert_msg ASC);

CREATE TABLE kaspa.signature_hit_on_company_minute(
    company text,
    alert_msg text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    PRIMARY KEY ((company), year, month, day, hour, minute, alert_msg)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, alert_msg ASC);

CREATE TABLE kaspa.signature_hit_on_company_hour(
    company text,
    alert_msg text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((company), year, month, day, hour, alert_msg)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, alert_msg ASC);

CREATE TABLE kaspa.signature_hit_on_company_day(
    company text,
    alert_msg text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((company), year, month, day, alert_msg)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, alert_msg ASC);



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
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC, alert_msg ASC);

CREATE TABLE kaspa.signature_hit_on_device_id_minute(
    device_id text,
    alert_msg text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    PRIMARY KEY ((device_id), year, month, day, hour, minute, alert_msg)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, alert_msg ASC);

CREATE TABLE kaspa.signature_hit_on_device_id_hour(
    device_id text,
    alert_msg text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((device_id), year, month, day, hour, alert_msg)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, alert_msg ASC);

CREATE TABLE kaspa.signature_hit_on_device_id_day(
    device_id text,
    alert_msg text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((device_id), year, month, day, alert_msg)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, alert_msg ASC);





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
    PRIMARY KEY((company), year, month, day, hour, minute, second, protocol)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC. protocol ASC);

CREATE TABLE kaspa.protocol_hit_on_company_minute(
    company text,
    protocol text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    PRIMARY KEY ((company), year, month, day, hour, minute, second, protocol)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, protocol ASC);

CREATE TABLE kaspa.protocol_hit_on_company_hour(
    company text,
    protocol text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((company), year, month, day, hour, protocol)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, protocol ASC);

CREATE TABLE kaspa.protocol_hit_on_company_day(
    company text,
    protocol text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((company), year, month, day)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, key ASC);





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
    PRIMARY KEY((company), year, month, day, hour, minute, second, protocol)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC, protocol ASC);

CREATE TABLE kaspa.protocol_hit_on_device_id_minute(
    device_id text,
    protocol text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    PRIMARY KEY ((company), year, month, day, hour, minute, second, protocol)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, protocol ASC);

CREATE TABLE kaspa.protocol_hit_on_device_id_hour(
    device_id text,
    protocol text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((company), year, month, day, hour, protocol)
) WITH CLUSTERING ORDER BY (key ASC, year DESC, month DESC, day DESC, hour DESC, protocol ASC);

CREATE TABLE kaspa.protocol_hit_on_device_id_day(
    device_id text,
    protocol text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((company), year, month, day, protocol)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, protocol ASC);




CREATE TABLE kaspa.protocol_by_sport_hit_on_company_second(
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
    PRIMARY KEY ((company, protocol),year, month, day, hour, minute, second, src_port)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC, src_port ASC);

CREATE TABLE kaspa.protocol_by_sport_hit_on_company_minute(
    company text,
    protocol text,
    src_port text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    PRIMARY KEY ((company, protocol), year, month, day, hour, minute, src_port)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, src_port ASC);

CREATE TABLE kaspa.protocol_by_sport_hit_on_company_hour(
    company text,
    protocol text,
    src_port text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((company, protocol), year, month, day, hour, src_port)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, src_port);

CREATE TABLE kaspa.protocol_by_sport_hit_on_company_day(
    company text,
    protocol text,
    src_port text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((company, protocol), year, month, day, src_port)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, src_port ASC);




CREATE TABLE kaspa.protocol_by_dport_hit_on_company_second(
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
    PRIMARY KEY ((company, protocol), year, month, day, hour, minute, second, dst_port)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC, dst_port ASC);

CREATE TABLE kaspa.protocol_by_dport_hit_on_company_minute(
    company text,
    protocol text,
    dst_port text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    PRIMARY KEY ((company, protocol), year, month, day, hour, minute, dst_port)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, dst_port ASC);

CREATE TABLE kaspa.protocol_by_dport_hit_on_company_hour(
    company text,
    protocol text,
    dst_port text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((company, protocol), year, month, day, hour, dst_port)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, dst_port ASC);

CREATE TABLE kaspa.protocol_by_dport_hit_on_company_day(
    company text,
    protocol text,
    dst_port text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((company, protocol), year, month, day, dst_port)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, dst_port ASC);



CREATE TABLE kaspa.protocol_by_sport_hit_on_device_id_second(
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
    PRIMARY KEY ((device_id, protocol),year, month, day, hour, minute, second, src_port)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC, src_port ASC);

CREATE TABLE kaspa.protocol_by_sport_hit_on_device_id_minute(
    device_id text,
    protocol text,
    src_port text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    PRIMARY KEY ((device_id, protocol), year, month, day, hour, minute, src_port)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, src_port ASC);

CREATE TABLE kaspa.protocol_by_sport_hit_on_device_id_hour(
    device_id text,
    protocol text,
    src_port text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((device_id, protocol), year, month, day, hour, src_port)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, src_port);

CREATE TABLE kaspa.protocol_by_sport_hit_on_device_id_day(
    device_id text,
    protocol text,
    src_port text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((device_id, protocol), year, month, day, src_port)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, src_port ASC);




CREATE TABLE kaspa.protocol_by_dport_hit_on_device_id_second(
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
    PRIMARY KEY ((device_id, protocol), year, month, day, hour, minute, second, dst_port)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC, dst_port ASC);

CREATE TABLE kaspa.protocol_by_dport_hit_on_device_id_minute(
    device_id text,
    protocol text,
    dst_port text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    PRIMARY KEY ((device_id, protocol), year, month, day, hour, minute, dst_port)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, dst_port ASC);

CREATE TABLE kaspa.protocol_by_dport_hit_on_device_id_hour(
    device_id text,
    protocol text,
    dst_port text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((device_id, protocol), year, month, day, hour, dst_port)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, dst_port ASC);

CREATE TABLE kaspa.protocol_by_dport_hit_on_device_id_day(
    device_id text,
    protocol text,
    dst_port text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((device_id, protocol), year, month, day, dst_port)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, dst_port ASC);




CREATE TABLE kaspa.ip_source_hit_on_company_sec(
    company text,
    src_ip text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
    PRIMARY KEY ((company), year, month, day, hour, minute, second, src_ip)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC, src_ip ASC)

CREATE TABLE kaspa.ip_source_hit_on_company_minute(
    company text,
    src_ip text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    PRIMARY KEY ((company), year, month, day, hour, minute, src_ip)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, src_ip ASC)

CREATE TABLE kaspa.ip_source_hit_on_company_hour(
    company text,
    src_ip text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((company), year, month, day, hour, src_ip)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, src_ip ASC)

CREATE TABLE kaspa.ip_source_hit_on_company_day(
    company text,
    src_ip text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((company), year, month, day, src_ip)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, src_ip ASC)




CREATE TABLE kaspa.ip_dest_hit_on_company_sec(
    company text,
    dest_ip text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
    PRIMARY KEY ((company), year, month, day, hour, minute, second, dest_ip)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC, dest_ip ASC)

CREATE TABLE kaspa.ip_dest_hit_on_company_minute(
    company text,
    dest_ip text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    PRIMARY KEY ((company), year, month, day, hour, minute, dest_ip)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, dest_ip ASC)

CREATE TABLE kaspa.ip_dest_hit_on_company_hour(
    company text,
    dest_ip text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((company), year, month, day, hour, dest_ip)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, dest_ip ASC)

CREATE TABLE kaspa.ip_dest_hit_on_company_day(
    company text,
    dest_ip text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((company), year, month, day, dest_ip)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, dest_ip ASC)




CREATE TABLE kaspa.ip_source_hit_on_device_id_sec(
    device_id text,
    src_ip text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
    PRIMARY KEY ((device_id), year, month, day, hour, minute, second, src_ip)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC, src_ip ASC);

CREATE TABLE kaspa.ip_source_hit_on_device_id_minute(
    device_id text,
    src_ip text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    PRIMARY KEY ((device_id), year, month, day, hour, minute, src_ip)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, src_ip ASC);

CREATE TABLE kaspa.ip_source_hit_on_device_id_hour(
    device_id text,
    src_ip text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((device_id), year, month, day, hour, src_ip)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, src_ip ASC);

CREATE TABLE kaspa.ip_source_hit_on_device_id_day(
    device_id text,
    src_ip text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((device_id), year, month, day, src_ip)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, src_ip ASC);




CREATE TABLE kaspa.ip_dest_hit_on_device_id_sec(
    device_id text,
    dest_ip text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
    PRIMARY KEY ((device_id), year, month, day, hour, minute, second, dest_ip)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC, dest_ip ASC);

CREATE TABLE kaspa.ip_dest_hit_on_device_id_minute(
    device_id text,
    dest_ip text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    PRIMARY KEY ((device_id), year, month, day, hour, minute, dest_ip)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, dest_ip ASC);

CREATE TABLE kaspa.ip_dest_hit_on_device_id_hour(
    device_id text,
    dest_ip text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((device_id), year, month, day, hour, dest_ip)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, dest_ip ASC);

CREATE TABLE kaspa.ip_dest_hit_on_device_id_day(
    device_id text,
    dest_ip text,
    country text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((device_id), year, month, day, dest_ip)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, dest_ip ASC);






CREATE TABLE kaspa.country_source_hit_on_company_second(
    company text,
    src_country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
    PRIMARY KEY ((company), year, month, day, hour, minute, second, src_country)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC, src_country ASC);

CREATE TABLE kaspa.country_source_hit_on_company_minute(
    company text,
    src_country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    PRIMARY KEY ((company), year, month, day, hour, minute, src_country)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, src_country ASC);

CREATE TABLE kaspa.country_source_hit_on_company_hour(
    company text,
    src_country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((company), year, month, day, hour, src_country)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, src_country);

CREATE TABLE kaspa.country_source_hit_on_company_day(
    company text,
    src_country text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((company), year, month, day, src_country)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, src_country ASC);






CREATE TABLE kaspa.country_dest_hit_on_company_second(
    company text,
    dest_country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
    PRIMARY KEY ((company), year, month, day, hour, minute, second, dest_country)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC, dest_country ASC);

CREATE TABLE kaspa.country_dest_hit_on_company_minute(
    company text,
    dest_country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    PRIMARY KEY ((company), year, month, day, hour, minute, dest_country)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, dest_country ASC);

CREATE TABLE kaspa.country_dest_hit_on_company_hour(
    company text,
    dest_country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((company), year, month, day, hour, dest_country)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, dest_country);

CREATE TABLE kaspa.country_dest_hit_on_company_day(
    company text,
    dest_country text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((company), year, month, day, dest_country)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, dest_country ASC);





CREATE TABLE kaspa.country_source_hit_on_device_id_second(
    device_id text,
    src_country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
    PRIMARY KEY ((device_id), year, month, day, hour, minute, second, src_country)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC, src_country ASC);

CREATE TABLE kaspa.country_source_hit_on_device_id_minute(
    device_id text,
    src_country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    PRIMARY KEY ((device_id), year, month, day, hour, minute, src_country)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, src_country ASC);

CREATE TABLE kaspa.country_source_hit_on_device_id_hour(
    device_id text,
    src_country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((device_id), year, month, day, hour, src_country)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, src_country);

CREATE TABLE kaspa.country_source_hit_on_device_id_day(
    device_id text,
    src_country text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((device_id), year, month, day, src_country)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, src_country ASC);






CREATE TABLE kaspa.country_dest_hit_on_device_id_second(
    device_id text,
    dest_country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
    PRIMARY KEY ((device_id), year, month, day, hour, minute, second, dest_country)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC, dest_country ASC);

CREATE TABLE kaspa.country_dest_hit_on_device_id_minute(
    device_id text,
    dest_country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    PRIMARY KEY ((device_id), year, month, day, hour, minute, dest_country)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, dest_country ASC);

CREATE TABLE kaspa.country_dest_hit_on_device_id_hour(
    device_id text,
    dest_country text,
    value bigint,
    year int,
    month int,
    day int,
    hour int,
    PRIMARY KEY ((device_id), year, month, day, hour, dest_country)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, dest_country);

CREATE TABLE kaspa.country_dest_hit_on_device_id_day(
    device_id text,
    dest_country text,
    value bigint,
    year int,
    month int,
    day int,
    PRIMARY KEY ((device_id), year, month, day, dest_country)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, dest_country ASC);
