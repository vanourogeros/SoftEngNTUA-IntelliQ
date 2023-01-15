DROP SCHEMA TouLou;
CREATE SCHEMA TouLou;
USE TouLou;

DROP TABLE IF EXISTS Questionnaire;
CREATE TABLE Questionnaire (
QQID char(10) PRIMARY KEY,
Title varchar(255) ,
Mask varchar(255)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS Question;
CREATE TABLE Question (
QID char(10) PRIMARY KEY,
QQID char(10) NOT NULL,
Qtext varchar(255),
Mandatory bit,
Personal bit,
CONSTRAINT QuestionQuestionnaire FOREIGN KEY (QQID) REFERENCES Questionnaire (QQID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS Keyword ;
CREATE TABLE Keyword (
QQID char(10) NOT NULL,
Keyword varchar(255) PRIMARY KEY,
CONSTRAINT KeywordQuestionnaire FOREIGN KEY (QQID) REFERENCES Questionnaire (QQID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS Choice ;
CREATE TABLE Choice (
ChoiceID char(10) PRIMARY KEY,
QQID char(10) NOT NULL,
QID char(10) NOT NULL,
ChoiceText varchar(255) NOT NULL,
NextQID char(10) NOT NULL,
CONSTRAINT ChoicesQuestionnaire FOREIGN KEY (QQID) REFERENCES Questionnaire(QQID) ,
CONSTRAINT ChoicesQuestion FOREIGN KEY (QID) REFERENCES Question(QID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS Participant ;
CREATE TABLE Participant (
SessionID char(10) PRIMARY KEY,
QQID char(10) NOT NULL,
CONSTRAINT ParticipantsQuestionnaire FOREIGN KEY (QQID) REFERENCES Questionnaire(QQID) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS Answer ;
CREATE TABLE Answer (
QQID char(10) NOT NULL,
QID char(10) NOT NULL,
SessionID char(10) NOT NULL,
ChoiceID char(10) Not null,
CONSTRAINT AnswersQuestionnaire FOREIGN KEY (QQID) REFERENCES Questionnaire (QQID),
CONSTRAINT AnswersQuestion FOREIGN KEY (QID) REFERENCES Question(QID),
CONSTRAINT AnswersChoices FOREIGN KEY (ChoiceID) REFERENCES Choice (ChoiceID),
CONSTRAINT AnswersSession FOREIGN KEY (SessionID) REFERENCES Participant (SessionID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;






