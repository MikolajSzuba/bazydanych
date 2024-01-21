SELECT date_part('day', godziny.data_) dzień, 
date_part('month', godziny.data_) miesiąc
FROM rozliczenia.godziny;
