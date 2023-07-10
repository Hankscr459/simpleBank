Create Table accounts (
  id bigserial PRIMARY KEY,
  owner varchar(255) NOT NULL,
  balance bigint NOT NULL,
  currency varchar(255) NOT NULL,
  created_at timestamptz NOT NULL DEFAULT (now())
);

Create Table entries (
  id bigserial PRIMARY KEY,
  account_id bigint,
  amount bigint NOT NULL,
  created_at timestamptz NOT NULL DEFAULT (now())
);

Create Table transfers (
  id bigserial PRIMARY KEY,
  from_account_id bigint,
  to_account_id bigint,
  amount bigint NOT NULL,
  created_at timestamptz NOT NULL DEFAULT (now())
);

ALTER Table "entries" ADD FOREIGN KEY ("account_id") REFERENCES "accounts" ("id");

ALTER TABLE "transfers" ADD FOREIGN KEY ("from_account_id") REFERENCES "accounts" ("id");

ALTER Table "transfers" ADD FOREIGN KEY ("to_account_id") REFERENCES "accounts" ("id");