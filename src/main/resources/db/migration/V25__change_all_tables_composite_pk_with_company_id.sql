-- Fix nullable company_id columns to NOT NULL DEFAULT '' before adding to PK

UPDATE ereturn SET company_id = '' WHERE company_id IS NULL;
ALTER TABLE ereturn MODIFY company_id varchar(50) NOT NULL DEFAULT '';

UPDATE estimate SET company_id = '' WHERE company_id IS NULL;
ALTER TABLE estimate MODIFY company_id varchar(50) NOT NULL DEFAULT '';

UPDATE preturn SET company_id = '' WHERE company_id IS NULL;
ALTER TABLE preturn MODIFY company_id varchar(50) NOT NULL DEFAULT '';

UPDATE purchase SET company_id = '' WHERE company_id IS NULL;
ALTER TABLE purchase MODIFY company_id varchar(50) NOT NULL DEFAULT '';

UPDATE sales SET company_id = '' WHERE company_id IS NULL;
ALTER TABLE sales MODIFY company_id varchar(50) NOT NULL DEFAULT '';

UPDATE sreturn SET company_id = '' WHERE company_id IS NULL;
ALTER TABLE sreturn MODIFY company_id varchar(50) NOT NULL DEFAULT '';

UPDATE stock_entry SET company_id = '' WHERE company_id IS NULL;
ALTER TABLE stock_entry MODIFY company_id varchar(50) NOT NULL DEFAULT '';

-- Change primary keys to composite (pk_col, company_id)

ALTER TABLE cust DROP PRIMARY KEY, ADD PRIMARY KEY (cid, company_id);

ALTER TABLE cust_bill DROP PRIMARY KEY, ADD PRIMARY KEY (sno, company_id);

ALTER TABLE ereturn DROP PRIMARY KEY, ADD PRIMARY KEY (billno, company_id);

ALTER TABLE estimate DROP PRIMARY KEY, ADD PRIMARY KEY (billno, company_id);

ALTER TABLE preturn DROP PRIMARY KEY, ADD PRIMARY KEY (grn, company_id);

ALTER TABLE purchase DROP PRIMARY KEY, ADD PRIMARY KEY (grn, company_id);

ALTER TABLE sales DROP PRIMARY KEY, ADD PRIMARY KEY (billno, company_id);

ALTER TABLE sreturn DROP PRIMARY KEY, ADD PRIMARY KEY (billno, company_id);

ALTER TABLE stock_entry DROP PRIMARY KEY, ADD PRIMARY KEY (grn, company_id);

ALTER TABLE ven_bill DROP PRIMARY KEY, ADD PRIMARY KEY (sno, company_id);

ALTER TABLE vendor DROP PRIMARY KEY, ADD PRIMARY KEY (cname, company_id);
