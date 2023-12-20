CREATE TABLE "StationsPersonal" (
  "PersNr" integer PRIMARY KEY,
  "Name" varchar,
  "StatNr" integer
);

CREATE TABLE "Station" (
  "StatNr" integer PRIMARY KEY,
  "Name" varchar
);

CREATE TABLE "Doctor" (
  "PersNr" integer PRIMARY KEY,
  "Name" varchar,
  "StatNr" integer,
  "Area" varchar,
  "Rang" integer
);

CREATE TABLE "Caregivers" (
  "PersNr" integer PRIMARY KEY,
  "Name" varchar,
  "StatNr" integer,
  "Qualification" integer
);

CREATE TABLE "Patient" (
  "PatientNr" integer PRIMARY KEY,
  "Name" varchar,
  "Disease" varchar,
  "RoomNr" integer,
  "from" varchar,
  "to" varchar
);

CREATE TABLE "Room" (
  "RoomNr" integer PRIMARY KEY,
  "StatNr" integer,
  "Beds" integer[]
);

CREATE TABLE "Treats" (
  "PatientNr" integer,
  "PersNr" integer,
  PRIMARY KEY ("PatientNr", "PersNr")
);

ALTER TABLE "Treats" ADD FOREIGN KEY ("PatientNr") REFERENCES "Patient" ("PatientNr");

ALTER TABLE "Patient" ADD FOREIGN KEY ("RoomNr") REFERENCES "Room" ("RoomNr");

ALTER TABLE "StationsPersonal" ADD FOREIGN KEY ("StatNr") REFERENCES "Station" ("StatNr");

ALTER TABLE "Doctor" ADD FOREIGN KEY ("StatNr") REFERENCES "Station" ("StatNr");

ALTER TABLE "Caregivers" ADD FOREIGN KEY ("StatNr") REFERENCES "Station" ("StatNr");

ALTER TABLE "Room" ADD FOREIGN KEY ("StatNr") REFERENCES "Station" ("StatNr");

ALTER TABLE "Doctor" ADD FOREIGN KEY ("PersNr") REFERENCES "StationsPersonal" ("PersNr");

ALTER TABLE "Caregivers" ADD FOREIGN KEY ("PersNr") REFERENCES "StationsPersonal" ("PersNr");

ALTER TABLE "Treats" ADD FOREIGN KEY ("PersNr") REFERENCES "StationsPersonal" ("PersNr");

