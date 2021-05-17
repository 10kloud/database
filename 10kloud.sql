CREATE TABLE "user" (
  "id" SERIAL PRIMARY KEY,
  "mail" varchar,
  "password" varchar,
  "permission" int
);

CREATE TABLE "alarm" (
  "id" SERIAL PRIMARY KEY,
  "user_id" int,
  "name" varchar,
  "description" varchar,
  "silos_id" int,
  "severity_alarm" int,
  "threshold" decimal,
  "alarming_parameter" varchar
);

CREATE TABLE "alarm_history" (
  "alarm_id" int PRIMARY KEY,
  "data" date,
  "description" varchar
);

ALTER TABLE "alarm_history" ADD FOREIGN KEY ("alarm_id") REFERENCES "alarm" ("id");

ALTER TABLE "alarm" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");
