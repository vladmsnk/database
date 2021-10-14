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
	id INTEGER NOT NULL,
	messageType VARCHAR(50) NOT NULL,	
	PRIMARY KEY (messageType)	
);

CREATE TABLE IF NOT EXISTS FEEDBACK(
	id INTEGER NOT NULL,
	email VARCHAR(320) NOT NULL,
	userId INTEGER REFERENCES USERS(id),
	messageType INTEGER NOT NULL REFERENCES MESSAGETYPE(id),
	text_ TEXT NOT NULL,	
	statusCode INTEGER NOT NULL REFERENCES FEEDBACK_STATUS(id),
	PRIMARY KEY (id)	
);

CREATE TABLE IF NOT EXISTS HISTORY(
	id INTEGER NOT NULL,
	userId INTEGER NOT NULL REFERENCES USERS(id),
	login_time TIMESTAMP NOT NULL,
	logout_time TIMESTAMP NOT NULL,
	scenes INTEGER NOT NULL,
	attempts INTEGER NOT NULL,
	duration INTERVAL NOT NULL,
	PRIMARY KEY (id)	
);

/*
	желательно записать статусы последовательно, 
	чтобы продвигать статус обратной связи, инкремируя id названия статуса
*/
CREATE TABLE IF NOT EXISTS FEEDBACK_STATUS(
	id INTEGER NOT NULL,
	statusName VARCHAR(50) NOT NULL,	
	PRIMARY KEY (id)	
);