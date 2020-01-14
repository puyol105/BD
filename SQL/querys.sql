DELIMITER //
#Primeira query: Quantos atletas correram 1200M em Barreiras
CREATE PROCEDURE atletaModCat(in modalidade varchar(200), in Cate varchar(200))
begin
 SELECT Atleta.nome, Modalidade.designação, Categoria.designação
FROM Atleta  
INNER JOIN Modalidade 
ON Atleta.Modalidade_idModalidade = Modalidade.idModalidade and Modalidade.designação= modalidade 
INNER JOIN Categoria ON Atleta.Categoria_idCategoria=Categoria.idCategoria
WHERE Categoria.designação= Cate;
end//
DELIMITER ;

call atletaModCat('Corrida de Obstaculos', '1200M');

DELIMITER //
#Segunda query: Quantos testes clinicos foram agendados por atletas do clube XXXX?
CREATE PROCEDURE testePorClube(in cl VARCHAR(200))
begin
 SELECT count(*) idTesteclinico
 FROM Atleta
 INNER JOIN Clube
 ON Atleta.Clube_idClube = Clube.idClube and Clube.mome= Cl
 INNER JOIN Agendamento 
 ON Agendamento.Atleta_idAtleta=Atleta.idAtleta
 INNER JOIN TesteClinico
 ON TesteClinico.Agendamento_nºagendamento= Agendamento.nºagendamento;
 END//

call testePorClube('Sport Lisboa e Benfica')

//
#Terceira Query: Quantos testes clinicos forma supervisonados por médicos com mais de 15 anos de serviço?
CREATE PROCEDURE testesPorMedicoAS(in anos int)
BEGIN
SELECT distinct TesteClinico.idTesteclinico, Medico.nome
FROM Medico
INNER JOIN Agendamento
ON Agendamento.Medico_idMedico=Medico.idMedico and TIMESTAMPDIFF(YEAR, Medico.dataInicioServiço, now()) > anos
INNER JOIN TesteClinico
ON TesteClinico.Agendamento_nºagendamento=Agendamento_nºagendamento;
END//

call testesPorMedicoAS('15')

//
#Quarta QUery: Quais os nomes dos utensilios utilizados no teste clinico xxxx?
CREATE PROCEDURE utensilioPorTeste(in testealvo int)
BEGIN
SELECT distinct Utensilio.nome,
TesteClinico_has_Utensilio.TesteClinico_idTesteClinico 
FROM Utensilio
INNER JOIN TesteClinico_has_Utensilio
ON  TesteClinico_has_Utensilio.TesteClinico_idTesteClinico= testealvo;
END//

call utensilioPorTeste('1')
//

