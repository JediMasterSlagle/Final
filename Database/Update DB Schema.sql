-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/g1CFD8
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Accidents19" (
    "CASENUM" int   NOT NULL,
    "REGIONNAME" int   NOT NULL,
    "MONTH" int   NOT NULL,
    "YEAR" int   NOT NULL,
    "WEATHER" int   NOT NULL,
    "OUTCOME" int   NOT NULL,
    CONSTRAINT "pk_Accidents19" PRIMARY KEY (
        "CASENUM"
     )
);

CREATE TABLE "Vehicle19" (
    "CASENUM" int   NOT NULL,
    "MAK_MOD" int   NOT NULL
);

CREATE TABLE "Accidents20" (
    "CASENUM" int   NOT NULL,
    "REGIONNAME" int   NOT NULL,
    "MONTH" int   NOT NULL,
    "YEAR" int   NOT NULL,
    "WEATHER" int   NOT NULL,
    "OUTCOME" int   NOT NULL
);

CREATE TABLE "Vehicle20" (
    "CASENUM" int   NOT NULL,
    "MAK_MOD" int   NOT NULL
);

ALTER TABLE "Accidents19" ADD CONSTRAINT "fk_Accidents19_CASENUM" FOREIGN KEY("CASENUM")
REFERENCES "Vehicle19" ("CASENUM");

ALTER TABLE "Accidents20" ADD CONSTRAINT "fk_Accidents20_CASENUM" FOREIGN KEY("CASENUM")
REFERENCES "Accidents19" ("CASENUM");

ALTER TABLE "Vehicle20" ADD CONSTRAINT "fk_Vehicle20_CASENUM" FOREIGN KEY("CASENUM")
REFERENCES "Accidents19" ("CASENUM");

