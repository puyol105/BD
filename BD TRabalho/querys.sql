/*DELIMITER //

DELIMITER
#1 query:Quais os nomes dos atletas que correm os 100m barreiras
create procedure nomeAtleta100m(out nomesAtle varchar(200))
BEGIN
	set nomesAtle =(SELECT Atleta.nome 
	FROM Atleta
	Join Modalidade ON Modalidade.idModalidade = Atleta.Modalidade_idModalidade and 
	Join Categoria 	ON Categoria.idCategoria = Atleta.Categoria_idCategoria
	Where Modalidade.designação = 'Corrida de Obstaculos');

END//

#2query:Quantos testes clínicos foram agendados por atletas do clube XXXX?
create procedure testesClube(out listTestes table )

#3query:Quantos testes clínicos foram supervisionados por médicos com mais de 15 anos de serviço?
//
CREATE procedure supervisaoTestes(in anos int, out nTestesClinicos int) 
BEGIN

Select count(*)
From TesteClinico, Agendamento, Medico
where TIMESTAMPDIFF(YEAR, now(), Medico.dataInicioServico) > anos
  and TesteClinico.Agendamento_nºagendamento = Agendamento.nºagendamento
  and Agendamento.Medico_idMedico = Medico.idMedico;
    
END//
delimiter ;
SET @anos='15';
CALL supervisaoTestes(@anos);
DROP PROCEDURE supervisaoTestes;


#4query:Quais os nomes dos utensílios utilizados no teste clínico 123456?*/

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