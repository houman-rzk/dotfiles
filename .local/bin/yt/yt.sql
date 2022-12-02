DROP TABLE IF EXISTS Channel;
DROP TABLE IF EXISTS Video;

CREATE TABLE Channel (
    channelId   TEXT NOT NULL,
    name        TEXT,
    PRIMARY KEY (channelId)
);

CREATE TABLE Video (
    videoId     TEXT NOT NULL,
    channelId   TEXT,
    title       TEXT,
    PRIMARY KEY (videoId),
    FOREIGN KEY (channelId) REFERENCES Channel(channelId)
);
