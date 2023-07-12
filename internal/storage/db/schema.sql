-- noinspection SqlNoDataSourceInspectionForFile

CREATE TABLE IF NOT EXISTS Users (
    id varchar(42) PRIMARY KEY,
    nickname varchar(256),
    description text,
    nonce bigint,
    registered timestamp,
    status smallint,
	tags text,
	rating double precision,
    account bigint
                                 );

CREATE TABLE IF NOT EXISTS Projects (
		id bigint PRIMARY KEY generated always as identity,
		title varchar(1024),
		description text,
		tags text,
		created timestamp,
		status smallint,
		owner varchar(42) REFERENCES Users(id),
		contractor varchar(42) REFERENCES Users(id),
		started timestamp,
		deadline interval,
		price bigint
                                    );

CREATE TABLE IF NOT EXISTS Bids (
		id bigint PRIMARY KEY generated always as identity,
		project bigint REFERENCES Projects(id),
		contractor varchar(42) REFERENCES Users(id),
		price bigint,
		deadline interval,
		message text
                                );

CREATE TABLE IF NOT EXISTS Rates (
        id bigint PRIMARY KEY generated always as identity,
		fromUser varchar(42) REFERENCES Users(id),
		project bigint REFERENCES Projects(id),
		toUser varchar(42) REFERENCES Users(id),
		rate smallint,
		message text
                                 );

