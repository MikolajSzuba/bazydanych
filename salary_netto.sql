ALTER TABLE rozliczenia.pensje
RENAME kwota TO kwota_brutto;

ALTER TABLE rozliczenia.pensje
ADD kwota_netto DECIMAL(12,2);

UPDATE rozliczenia.pensje
SET kwota_netto = kwota_brutto * 0.78;
