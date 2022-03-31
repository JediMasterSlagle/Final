﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/g1CFD8
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Accidents" (
    "CASENUM" int   NOT NULL,
    "REGION" int   NOT NULL,
    "MONTH" int   NOT NULL,
    "YEAR" int   NOT NULL,
    "WEATHER" int   NOT NULL,
    "OUTCOME" int   NOT NULL,
    CONSTRAINT "pk_Accidents" PRIMARY KEY (
        "CASENUM"
     )
);

CREATE TABLE "Vehicle" (
    "CASENUM" int   NOT NULL,
    -- MAKE AND MODEL
    "MAK_MOD" int   NOT NULL
);

CREATE TABLE "Weather" (
    "CASENUM" INT   NOT NULL,
    "REGOIN" INT   NOT NULL,
    "WEATHER" INT   NOT NULL
);

ALTER TABLE "Vehicle" ADD CONSTRAINT "fk_Vehicle_CASENUM" FOREIGN KEY("CASENUM")
REFERENCES "Accidents" ("CASENUM");

ALTER TABLE "Weather" ADD CONSTRAINT "fk_Weather_CASENUM" FOREIGN KEY("CASENUM")
REFERENCES "Accidents" ("CASENUM");
