SELECT idClube,nome,sigla
FROM
    Clube    
INTO OUTFILE 'admin:///newpath/csvfile' 
FIELDS ENCLOSED BY '"' 
TERMINATED BY ';' 
ESCAPED BY '"' 
LINES TERMINATED BY '\r\n';

