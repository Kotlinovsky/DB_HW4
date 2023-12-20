CREATE TABLE "City" (
  "Name" varchar,
  "Region" varchar,
  PRIMARY KEY ("Name")
);

CREATE TABLE "Station" (
  "Name" varchar PRIMARY KEY,
  "CityName" varchar,
  "Region" varchar,
  "Tracks" varchar[]
);

CREATE TABLE "Train" (
  "TrainNr" integer PRIMARY KEY,
  "Length" decimal,
  "StartStationName" varchar,
  "EndStationName" varchar
);

CREATE TABLE "Connection" (
  "FromStation" varchar,
  "ToStation" varchar,
  "TrainNr" varchar,
  "Departure" timestamp,
  "Arrival" timestamp,
  PRIMARY KEY ("FromStation", "ToStation", "TrainNr")
);

ALTER TABLE "Train" ADD FOREIGN KEY ("StartStationName") REFERENCES "Station" ("Name");

ALTER TABLE "Train" ADD FOREIGN KEY ("EndStationName") REFERENCES "Station" ("Name");

ALTER TABLE "Station" ADD FOREIGN KEY ("CityName") REFERENCES "City" ("Name");

ALTER TABLE "Connection" ADD FOREIGN KEY ("FromStation") REFERENCES "Station" ("Name");

ALTER TABLE "Connection" ADD FOREIGN KEY ("ToStation") REFERENCES "Station" ("Name");

