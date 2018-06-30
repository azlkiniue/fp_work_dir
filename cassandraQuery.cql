DROP KEYSPACE IF EXISTS kaspa;
CREATE KEYSPACE kaspa WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};

USE kaspa;

CREATE TABLE kaspa.raw_data(
    id UUID,            --uuid for reason
    device_id text,     --Device ID of corresponding sensor
    year int,           --Year Collected
    month int,          --Month Collected
    day int,            --Day collected
    hour int,           --Hour collected
    minute int,         --Minute collected
    second int,         --Second collected
    protocol text,      --Protocol of detected signature
    ip_type text,       --Type of IP (V4/V6) of corresponding alert
    src_mac text,       --Source mac address
    dest_mac text,      --Destination mac address
    src_ip text,        --Source IP address
    dest_ip text,       --Destination IP address
    src_port int,       --Source port
    dst_port int,       --Destination port
    alert_msg text,     --Alert messages
    classification int, --Classification of alert signature
    priority int,       --Priority of coresponding alert
    sig_id  int,        --Signature ID of alert
    sig_gen int,        --Generated signature of alert
    sig_rev int,        --signature revision number
    src_country text,        --Source country of coresponding alert
    PRIMARY KEY ((device_id), year, month, day, hour, minute, second)       
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC);

CREATE TABLE kaspa.sensor_device(
    device_id text PRIMARY KEY,     --Sensor device name
    username text,      --Sensor account owner
    secret_key text,    --Secret key to establish communication
    hostname text,      --Sensor hostname
    ip_address text,    --Sensor ip address
    netint text,        --Sensor network interface
    location text,      --Sensor physical location
    company text,       --Sensor owner
    topic_global text,  --Topic for global purposes, for future references
    topic_cmd text,     --Topic for commanding sensor
    topic_resp text     --Topic for user response
);

CREATE TABLE kaspa.user(
    username text PRIMARY KEY,      --Account username
    email text,         --Account email
    password_hash text, --Hashed Password
    api_key text,       --Account API Key
    token text          --Account access token
);

--SIGNATURE AGGREGATE

CREATE TABLE kaspa.every_second_aggregate_signature(
    device_id text,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
    signature text,
    value counter,
    PRIMARY KEY ((device_id), year, month, day, hour, minute, second)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC);

CREATE TABLE kaspa.every_minute_aggregate_signature(
    device_id text,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    signature text,
    value counter,
PRIMARY KEY ((device_id), year, month, day, hour, minute)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC);

CREATE TABLE kaspa.hourly_aggregate_signature(
    device_id text,
    year int,
    month int,
    day int,
    hour int,
    signature text,
    value counter,
PRIMARY KEY ((device_id), year, month, day, hour)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC);

CREATE TABLE kaspa.daily_aggregate_signature(
    device_id text,
    year int,
    month int,
    day int,
    signature text,
    value counter,
PRIMARY KEY ((device_id), year, month, day)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC);

CREATE TABLE kaspa.monthly_aggregate_signature(
    device_id text,
    year int,
    month int,
    signature text,
    value counter,
PRIMARY KEY ((device_id), year, month)
) WITH CLUSTERING ORDER BY (year DESC, month DESC);

CREATE TABLE kaspa.anually_aggregate_signature(
    device_id text,
    year int,
    signature text,
    value counter,
PRIMARY KEY ((device_id), year)
) WITH CLUSTERING ORDER BY (year DESC);

--SIGNATURE AGGREGATE

--COUNTRY AGGREGATE
CREATE TABLE kaspa.every_second_aggregate_country(
    device_id text,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
    country text,
    value counter,
    PRIMARY KEY ((device_id), year, month, day, hour, minute, second)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC);

CREATE TABLE kaspa.every_minute_aggregate_country(
    device_id text,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    country text,
    value counter,
PRIMARY KEY ((device_id), year, month, day, hour, minute)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC);

CREATE TABLE kaspa.hourly_aggregate_country(
    device_id text,
    year int,
    month int,
    day int,
    hour int,
    country text,
    value counter,
PRIMARY KEY ((device_id), year, month, day, hour)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC);

CREATE TABLE kaspa.daily_aggregate_country(
    device_id text,
    year int,
    month int,
    day int,
    country text,
    value counter,
PRIMARY KEY ((device_id), year, month, day)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC);

CREATE TABLE kaspa.monthly_aggregate_country(
    device_id text,
    year int,
    month int,
    country text,
    value counter,
PRIMARY KEY ((device_id), year, month)
) WITH CLUSTERING ORDER BY (year DESC, month DESC);

CREATE TABLE kaspa.anually_aggregate_country(
    device_id text,
    year int,
    country text,
    value counter,
PRIMARY KEY ((device_id), year)
) WITH CLUSTERING ORDER BY (year DESC);

--COUNTRY AGGREGATE

--PROTOCOL AGGREGATE
CREATE TABLE kaspa.every_second_aggregate_protocol(
    device_id text,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
    protocol text,
    value counter,
    PRIMARY KEY ((device_id), year, month, day, hour, minute, second)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC);

CREATE TABLE kaspa.every_minute_aggregate_protocol(
    device_id text,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    protocol text,
    value counter,
PRIMARY KEY ((device_id), year, month, day, hour, minute)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC);

CREATE TABLE kaspa.hourly_aggregate_protocol(
    device_id text,
    year int,
    month int,
    day int,
    hour int,
    protocol text,
    value counter,
PRIMARY KEY ((device_id), year, month, day, hour)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC);

CREATE TABLE kaspa.daily_aggregate_protocol(
    device_id text,
    year int,
    month int,
    day int,
    protocol text,
    value counter,
PRIMARY KEY ((device_id), year, month, day)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC);

CREATE TABLE kaspa.monthly_aggregate_protocol(
    device_id text,
    year int,
    month int,
    protocol text,
    value counter,
PRIMARY KEY ((device_id), year, month)
) WITH CLUSTERING ORDER BY (year DESC, month DESC);

CREATE TABLE kaspa.anually_aggregate_protocol(
    device_id text,
    year int,
    protocol text,
    value counter,
PRIMARY KEY ((device_id), year)
) WITH CLUSTERING ORDER BY (year DESC);
--PROTOCOL AGGREGATE

--IP SOURCE AGGREGATE
CREATE TABLE kaspa.every_second_aggregate_protocol(
    device_id text,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    second int,
    ip_source text,
    value counter,
    PRIMARY KEY ((device_id), year, month, day, hour, minute, second)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC, second DESC);

CREATE TABLE kaspa.every_minute_aggregate_ip_source(
    device_id text,
    year int,
    month int,
    day int,
    hour int,
    minute int,
    ip_source text,
    value counter,
PRIMARY KEY ((device_id), year, month, day, hour, minute)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC, minute DESC);

CREATE TABLE kaspa.hourly_aggregate_ip_source(
    device_id text,
    year int,
    month int,
    day int,
    hour int,
    ip_source text,
    value counter,
PRIMARY KEY ((device_id), year, month, day, hour)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC, hour DESC);

CREATE TABLE kaspa.daily_aggregate_ip_source(
    device_id text,
    year int,
    month int,
    day int,
    ip_source text,
    value counter,
PRIMARY KEY ((device_id), year, month, day)
) WITH CLUSTERING ORDER BY (year DESC, month DESC, day DESC);

CREATE TABLE kaspa.monthly_aggregate_ip_source(
    device_id text,
    year int,
    month int,
    ip_source text,
    value counter,
PRIMARY KEY ((device_id), year, month)
) WITH CLUSTERING ORDER BY (year DESC, month DESC);

CREATE TABLE kaspa.anually_aggregate_ip_source(
    device_id text,
    year int,
    ip_source text,
    value counter,
PRIMARY KEY ((device_id), year)
) WITH CLUSTERING ORDER BY (year DESC);
--IP SOURCE AGGREGATE

