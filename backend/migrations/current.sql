CREATE TABLE schedule_events (
	start_time TIMESTAMP NOT NULL,
	end_time TIMESTAMP,
	picture_url TEXT NOT NULL,
	title TEXT NOT NULL,
	text TEXT,
	location TEXT NOT NULL
);