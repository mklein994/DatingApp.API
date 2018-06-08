CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
    "MigrationId" TEXT NOT NULL CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY,
    "ProductVersion" TEXT NOT NULL
);

CREATE TABLE "Users" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Users" PRIMARY KEY AUTOINCREMENT,
    "City" TEXT NULL,
    "Country" TEXT NULL,
    "Created" TEXT NOT NULL,
    "DateOfBirth" TEXT NOT NULL,
    "Gender" TEXT NULL,
    "Interests" TEXT NULL,
    "Introduction" TEXT NULL,
    "KnownAs" TEXT NULL,
    "LastActive" TEXT NOT NULL,
    "LookingFor" TEXT NULL,
    "PasswordHash" BLOB NULL,
    "PasswordSalt" BLOB NULL,
    "Username" TEXT NULL
);

CREATE TABLE "Values" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Values" PRIMARY KEY AUTOINCREMENT,
    "Name" TEXT NULL
);

CREATE TABLE "Likes" (
    "LikerId" INTEGER NOT NULL,
    "LikeeId" INTEGER NOT NULL,
    CONSTRAINT "PK_Likes" PRIMARY KEY ("LikerId", "LikeeId"),
    CONSTRAINT "FK_Likes_Users_LikeeId" FOREIGN KEY ("LikeeId") REFERENCES "Users" ("Id") ON DELETE RESTRICT,
    CONSTRAINT "FK_Likes_Users_LikerId" FOREIGN KEY ("LikerId") REFERENCES "Users" ("Id") ON DELETE RESTRICT
);

CREATE TABLE "Messages" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Messages" PRIMARY KEY AUTOINCREMENT,
    "Content" TEXT NULL,
    "DateRead" TEXT NULL,
    "IsRead" INTEGER NOT NULL,
    "MessageSent" TEXT NOT NULL,
    "RecipientDeleted" INTEGER NOT NULL,
    "RecipientId" INTEGER NOT NULL,
    "SenderDeleted" INTEGER NOT NULL,
    "SenderId" INTEGER NOT NULL,
    CONSTRAINT "FK_Messages_Users_RecipientId" FOREIGN KEY ("RecipientId") REFERENCES "Users" ("Id") ON DELETE RESTRICT,
    CONSTRAINT "FK_Messages_Users_SenderId" FOREIGN KEY ("SenderId") REFERENCES "Users" ("Id") ON DELETE RESTRICT
);

CREATE TABLE "Photos" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Photos" PRIMARY KEY AUTOINCREMENT,
    "DateAdded" TEXT NOT NULL,
    "Description" TEXT NULL,
    "IsMain" INTEGER NOT NULL,
    "PublicId" TEXT NULL,
    "Url" TEXT NULL,
    "UserId" INTEGER NOT NULL,
    CONSTRAINT "FK_Photos_Users_UserId" FOREIGN KEY ("UserId") REFERENCES "Users" ("Id") ON DELETE CASCADE
);

CREATE INDEX "IX_Likes_LikeeId" ON "Likes" ("LikeeId");

CREATE INDEX "IX_Messages_RecipientId" ON "Messages" ("RecipientId");

CREATE INDEX "IX_Messages_SenderId" ON "Messages" ("SenderId");

CREATE INDEX "IX_Photos_UserId" ON "Photos" ("UserId");

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20180603034700_CreateSqliteDb', '2.0.3-rtm-10026');

