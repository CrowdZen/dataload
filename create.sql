
CREATE TABLE dining (
    id                  SERIAL PRIMARY KEY,
    time_ts             timestamp with time zone NOT NULL,
    activity_level      double precision NOT NULL,
    location            varchar(6) NOT NULL
);
