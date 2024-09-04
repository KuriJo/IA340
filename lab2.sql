CREATE TABLE IF NOT EXISTS "name" (
	"Fips" varchar(255) NOT NULL DEFAULT '4',
	"name" varchar(255) NOT NULL UNIQUE DEFAULT '100',
	PRIMARY KEY ("Fips")
);

CREATE TABLE IF NOT EXISTS "income" (
	"fips" varchar(4) NOT NULL,
	"Income" bigint NOT NULL,
	"year" bigint NOT NULL,
	PRIMARY KEY ("fips", "year")
);

CREATE TABLE IF NOT EXISTS "population" (
	"fips" varchar(4) NOT NULL,
	"income" bigint NOT NULL,
	"year" bigint NOT NULL,
	PRIMARY KEY ("fips", "year")
);


ALTER TABLE "income" ADD CONSTRAINT "income_fk0" FOREIGN KEY ("fips") REFERENCES "name"("Fips");
ALTER TABLE "population" ADD CONSTRAINT "population_fk0" FOREIGN KEY ("fips") REFERENCES "name"("Fips");
