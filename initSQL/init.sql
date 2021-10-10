CREATE DATABASE SelfRecordingDatabase;

/*
Длина электронной почты в соответствии с RFC 3696: 
это ограничение составляет не более 64 символов (октетов) в «локальной части» (до «@») 
и не более 255 символов (октетов) в доменной части (после «@») 
общей длиной 320 символов. 
*/
CREATE TABLE IF NOT EXISTS USERS(
	id INTEGER NOT NULL,
	email VARCHAR(320) NOT NULL,
	password VARCHAR(100) NOT NULL,
	verified BOOLEAN NOT NULL,
	CONSTRAINT uniqle UNIQUE(email),
	PRIMARY KEY (id)	
);
CREATE TABLE IF NOT EXISTS MESSAGETYPE(
	messagetype VARCHAR(50) NOT NULL,	
	PRIMARY KEY (messagetype)	
);
CREATE TABLE IF NOT EXISTS FEEDBACK(
	id INTEGER NOT NULL,
	email VARCHAR(320) NOT NULL,
	user_ INTEGER REFERENCES USERS(id),
	type_ VARCHAR(50) NOT NULL REFERENCES MESSAGETYPE(messagetype),
	text_ TEXT NOT NULL,	
	PRIMARY KEY (id)	
);
CREATE TABLE IF NOT EXISTS HISTORY(
	id INTEGER NOT NULL,
	user_ INTEGER NOT NULL REFERENCES USERS(id),
	login_ TIMESTAMP NOT NULL,
	logout TIMESTAMP NOT NULL,
	scenes INTEGER NOT NULL,
	attempts INTEGER NOT NULL,
	duration INTERVAL NOT NULL,	
	PRIMARY KEY (id)	
);