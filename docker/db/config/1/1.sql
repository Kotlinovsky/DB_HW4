CREATE TABLE "Reader" (
  "ID" integer PRIMARY KEY,
  "LastName" varchar,
  "FirstName" varchar,
  "Address" varchar,
  "BirthDay" date
);

CREATE TABLE "Book" (
  "ISBN" varchar PRIMARY KEY,
  "Title" varchar,
  "Author" varchar,
  "PagesNum" integer,
  "PubYear" integer,
  "PubName" varchar
);

CREATE TABLE "Publisher" (
  "PubName" varchar PRIMARY KEY,
  "PubKind" integer
);

CREATE TABLE "Category" (
  "CategoryName" varchar PRIMARY KEY,
  "ParentCat" varchar
);

CREATE TABLE "Copy" (
  "ISBN" varchar,
  "CopyNumber" integer,
  "Shelf" integer,
  "Position" integer,
  PRIMARY KEY ("ISBN", "CopyNumber")
);

CREATE TABLE "Borrowing" (
  "ISBN" varchar,
  "CopyNumber" integer,
  "ReaderNr" integer,
  "ReturnData" date,
  PRIMARY KEY ("ISBN", "CopyNumber")
);

CREATE TABLE "BookCat" (
  "ISBN" varchar PRIMARY KEY,
  "CategoryName" varchar
);

ALTER TABLE "BookCat" ADD FOREIGN KEY ("ISBN") REFERENCES "Book" ("ISBN");

ALTER TABLE "BookCat" ADD FOREIGN KEY ("CategoryName") REFERENCES "Category" ("CategoryName");

ALTER TABLE "Copy" ADD FOREIGN KEY ("ISBN") REFERENCES "Book" ("ISBN");

ALTER TABLE "Category" ADD FOREIGN KEY ("ParentCat") REFERENCES "Category" ("CategoryName");

ALTER TABLE "Book" ADD FOREIGN KEY ("PubName") REFERENCES "Publisher" ("PubName");

alter table "Borrowing"
                    add constraint "Borrowing_Copy_ISBN_CopyNumber_fk"
                        foreign key ("ISBN", "CopyNumber") references "Copy"
