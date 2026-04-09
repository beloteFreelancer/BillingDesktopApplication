ALTER TABLE company ADD COLUMN sales_terms TEXT DEFAULT NULL;
ALTER TABLE company ADD COLUMN estimate_terms TEXT DEFAULT NULL;

UPDATE company SET sales_terms = '1. Payment is due within 30 days from the invoice date.\n2. Goods once sold will not be taken back or exchanged without prior approval.\n3. All disputes are subject to the jurisdiction of local courts only.\n4. Goods remain property of the seller until full payment is received.' WHERE sales_terms IS NULL;

UPDATE company SET estimate_terms = '1. This is an estimate only and not a final invoice.\n2. Prices and availability are subject to change without prior notice.\n3. Goods once sold will not be taken back or exchanged without prior approval.\n4. All disputes are subject to the jurisdiction of local courts only.' WHERE estimate_terms IS NULL;
