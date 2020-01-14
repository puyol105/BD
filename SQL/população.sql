#Populate Residencia
INSERT INTO mydb.Residencia(morada, localidade, codigoPostal)
VALUES('Rua de Baixo','Braga', '4700-555');
INSERT INTO mydb.Residencia(morada, localidade, codigoPostal)
VALUES('Rua das Luzes','Porto', '4600-635');
INSERT INTO mydb.Residencia(morada, localidade, codigoPostal)
VALUES('Rua do Chiado ','Lisboa', '4634-592');
INSERT INTO mydb.Residencia(morada, localidade, codigoPostal)
VALUES('Rua do Casino','Chaves', '4831-596');
INSERT INTO mydb.Residencia(morada, localidade, codigoPostal)
VALUES('Rua Serpa Pinto','Póvoa de Varzim', '4490-680');

#Populate Clube
INSERT INTO mydb.Clube(mome, sigla)
VALUES('Grupo Desportivo de Chaves', 'GDC');
INSERT INTO mydb.Clube(mome, sigla)
VALUES('Sporting Clube de Braga', 'SCB');
INSERT INTO mydb.Clube(mome, sigla)
VALUES('Clube Desportivo da Póvoa', 'CDP');
INSERT INTO mydb.Clube(mome, sigla)
VALUES('Futebol Clube do Porto', 'FCP');
INSERT INTO mydb.Clube(mome, sigla)
VALUES('Sport Lisboa e Benfica', 'SLB');

#Populate Categoria
INSERT INTO mydb.Categoria(designação)
VALUES('100M');
INSERT INTO mydb.Categoria(designação)
VALUES('1200M');
INSERT INTO mydb.Categoria(designação)
VALUES('Martelo');
INSERT INTO mydb.Categoria(designação)
VALUES('Dardo');
INSERT INTO mydb.Categoria(designação)
VALUES('3000M');

#Populate modalidade
INSERT INTO mydb.Modalidade(designação)
VALUES('Corrida de Pista');
INSERT INTO mydb.Modalidade(designação)
VALUES('Salto em Comprimento');
INSERT INTO mydb.Modalidade(designação)
VALUES('Lançamento');
INSERT INTO mydb.Modalidade(designação)
VALUES('Corrida de Obstaculos');

#Populate Atleta table
INSERT INTO mydb.Atleta(nome, dataNascimento,Modalidade_idModalidade, telemovel,
Residencia_idResidencia,Clube_idClube,Categoria_idCategoria)
VALUES('Andre Sousa', '1996-02-28',
(Select  idModalidade From Modalidade where designação = 'Corrida de Pista'), 
'915237600',
(Select idResidencia From Residencia where morada= 'Rua Serpa Pinto' and localidade =  'Póvoa de Varzim'
 and codigoPostal = '4490-680'),
(Select idClube From Clube where mome = 'Clube Desportivo da Póvoa'),
(Select idCategoria From Categoria where designação = 'Martelo' ));
INSERT INTO mydb.Atleta(nome, dataNascimento,Modalidade_idModalidade, telemovel,
Residencia_idResidencia,Clube_idClube,Categoria_idCategoria)
VALUES('Adriana Gonçalves', '1996-06-03',
 (Select  idModalidade From Modalidade where designação = 'Lançamento'),
'914153009',
(Select idResidencia From Residencia where morada= 'Rua de Baixo' and localidade =  'Braga'
 and codigoPostal = '4700-555'), 
(Select idClube From Clube where mome = 'Sporting Clube de Braga'),
(Select idCategoria From Categoria where designação = 'Dardo' ));
INSERT INTO mydb.Atleta(nome, dataNascimento,Modalidade_idModalidade, telemovel,
Residencia_idResidencia,Clube_idClube,Categoria_idCategoria)
VALUES('Renato Cruzinha', '1996-12-02',
(Select  idModalidade From Modalidade where designação = 'Corrida de Obstaculos'),
 '925419727',
 (Select idResidencia From Residencia where morada= 'Rua do Casino' and localidade =  'Chaves'
 and codigoPostal = '4831-596'),
(Select idClube From Clube where mome = 'Grupo Desportivo de Chaves'),
(Select idCategoria From Categoria where designação = '1200M' ));
INSERT INTO mydb.Atleta(nome, dataNascimento,Modalidade_idModalidade, telemovel,
Residencia_idResidencia,Clube_idClube,Categoria_idCategoria)
VALUES('Bernado Viseu','1996-10-23' ,
(Select  idModalidade From Modalidade where designação = 'Corrida de Pista'),
 '967307452',
 (Select idResidencia From Residencia where morada= 'Rua do Chiado' and localidade =  'Lisboa'
 and codigoPostal = '4634-592'),
(Select idClube From Clube where mome = 'Sport Lisboa e Benfica'),
(Select idCategoria From Categoria where designação = '100M' ));
INSERT INTO mydb.Atleta(nome, dataNascimento,Modalidade_idModalidade, telemovel,
Residencia_idResidencia,Clube_idClube,Categoria_idCategoria)
VALUES('Miguel Cardoso', '1998-01-31' ,
(Select  idModalidade From Modalidade where designação = 'Corrida de Pista'),
 '934809123',
(Select idResidencia From Residencia where morada= 'Rua das Luzes' and localidade =  'Porto'
 and codigoPostal = '4600-635'),
(Select idClube From Clube where mome = 'Futebol Clube do Porto'),
(Select idCategoria From Categoria where designação = '3000M' ));
INSERT INTO mydb.Atleta(nome, dataNascimento,Modalidade_idModalidade, telemovel,
Residencia_idResidencia,Clube_idClube,Categoria_idCategoria)
VALUES('Rosa Moreira', '1985-12-25', 
(Select  idModalidade From Modalidade where designação = 'Lançamento'),
'91923949',
(Select idResidencia From Residencia where morada= 'Rua do Chiado' and localidade =  'Lisboa'
 and codigoPostal = '4634-592'),
(Select idClube From Clube where mome = 'Sport Lisboa e Benfica'),
(Select idCategoria From Categoria where designação = 'Dardo' ));

#populate Especialidade
INSERT INTO mydb.Especialidade(designação)
VALUES('Cardiologia');
INSERT INTO mydb.Especialidade(designação)
VALUES('Fisioterapia');
INSERT INTO mydb.Especialidade(designação)
VALUES('Ortopedia');
INSERT INTO mydb.Especialidade(designação)
VALUES('Pneumologia');

#Medico populate
INSERT INTO mydb.Medico(nome, dataInicioServiço, Especialidade_idEspecialidade)
VALUES('Teresa Coutinho','2005-01-11',(SELECT idEspecialidade FROM Especialidade WHERE designação='Cardiologia'));
INSERT INTO mydb.Medico(nome, dataInicioServiço, Especialidade_idEspecialidade)
VALUES('Antonio Leixal','2008-05-22',(SELECT idEspecialidade FROM Especialidade WHERE designação='Fisioterapia'));
INSERT INTO mydb.Medico(nome, dataInicioServiço, Especialidade_idEspecialidade)
VALUES('Miguel Soares','2004-01-20',(SELECT idEspecialidade FROM Especialidade WHERE designação='Ortopedia'));
INSERT INTO mydb.Medico(nome, dataInicioServiço, Especialidade_idEspecialidade)
VALUES('Sofia Rebelo','1997-12-05',(SELECT idEspecialidade FROM Especialidade WHERE designação='Pneumologia'));

#Populate Agendamento
INSERT INTO mydb.Agendamento(data_hora,Atleta_idAtleta, Medico_idMedico)
VALUES('2019-08-23 14:00:00',
(SELECT idAtleta FROM Atleta WHERE telemovel='915237600'),
(SELECT idMedico FROM Medico WHERE nome='Teresa Coutinho'));
INSERT INTO mydb.Agendamento(data_hora,Atleta_idAtleta, Medico_idMedico)
VALUES('2015-07-22 11:30:00',
(SELECT idAtleta FROM Atleta WHERE telemovel='914153009'),
(SELECT idMedico FROM Medico WHERE nome='Sofia Rebelo'));
INSERT INTO mydb.Agendamento(data_hora,Atleta_idAtleta, Medico_idMedico)
VALUES('2014-06-10 17:00:00',
(SELECT idAtleta FROM Atleta WHERE telemovel='925419727'),
(SELECT idMedico FROM Medico WHERE nome='Antonio Leixal'));
INSERT INTO mydb.Agendamento(data_hora,Atleta_idAtleta, Medico_idMedico)
VALUES('2017-11-05 16:00:00',
(SELECT idAtleta FROM Atleta WHERE telemovel='967307452'),
(SELECT idMedico FROM Medico WHERE nome='Miguel Soares'));
INSERT INTO mydb.Agendamento(data_hora,Atleta_idAtleta, Medico_idMedico)
VALUES('2012-09-23 11:00:00',
(SELECT idAtleta FROM Atleta WHERE telemovel='915237600'),
(SELECT idMedico FROM Medico WHERE nome='Sofia Rebelo'));
INSERT INTO mydb.Agendamento(data_hora,Atleta_idAtleta, Medico_idMedico)
VALUES('2012-10-11 09:00:00',
(SELECT idAtleta FROM Atleta WHERE telemovel='91923949'),
(SELECT idMedico FROM Medico WHERE nome='Teresa Coutinho'));
INSERT INTO mydb.Agendamento(data_hora,Atleta_idAtleta, Medico_idMedico)
VALUES('2012-10-11 09:30:00',
(SELECT idAtleta FROM Atleta WHERE telemovel='91923949'),
(SELECT idMedico FROM Medico WHERE nome='Teresa Coutinho'));

#populate utensilio
INSERT INTO mydb.Utensilio(nome)
VALUES('Equipamento de Raio X');
INSERT INTO mydb.Utensilio(nome)
VALUES('Aparelho de EletroCardioGrama');
INSERT INTO mydb.Utensilio(nome)
VALUES('Seringa');
INSERT INTO mydb.Utensilio(nome)
VALUES('Estetoscopio');
INSERT INTO mydb.Utensilio(nome)
VALUES('Unidade de Refração');

#populate TesteClinic
INSERT INTO mydb.TesteClinico(descrição, estado,Agendamento_nºagendamento)
VALUES('EletroCardiograma', 'A',(Select  nºagendamento From Agendamento where data_hora = '2012-10-11 09:00:00'));
INSERT INTO mydb.TesteClinico(descrição, estado,Agendamento_nºagendamento)
VALUES('Sangue', 'A',(Select  nºagendamento From Agendamento where data_hora = '2012-10-11 09:30:00'));
INSERT INTO mydb.TesteClinico(descrição, estado,Agendamento_nºagendamento)
VALUES('EletroCardiograma', 'R',(Select  nºagendamento From Agendamento where data_hora = '2019-08-23 14:00:00'));
INSERT INTO mydb.TesteClinico(descrição, estado,Agendamento_nºagendamento)
VALUES('Pulmões', 'A',(Select  nºagendamento From Agendamento where data_hora = '2014-06-10 17:00:00'));
INSERT INTO mydb.TesteClinico(descrição, estado,Agendamento_nºagendamento)
VALUES('Visão', 'R',(Select  nºagendamento From Agendamento where data_hora = '2017-11-05 16:00:00'));

#Populate TestClinicoHasUtensilio
INSERT INTO mydb.TesteClinico_has_Utensilio(TesteClinico_idTesteClinico, Utensilio_idUtensilio)
VALUES((SELECT idTesteclinico FROM TesteClinico 
WHERE  Agendamento_nºagendamento =((Select  nºagendamento From Agendamento where data_hora = '2012-10-11 09:00:00'))),
(SELECT idUtensilio FROM Utensilio WHERE nome='Aparelho de EletroCardioGrama'));
INSERT INTO mydb.TesteClinico_has_Utensilio(TesteClinico_idTesteClinico, Utensilio_idUtensilio)
VALUES((SELECT idTesteclinico FROM TesteClinico 
WHERE  Agendamento_nºagendamento =((Select  nºagendamento From Agendamento where data_hora = '2012-10-11 09:00:00'))),
(SELECT idUtensilio FROM Utensilio WHERE nome='Estetoscopio'));
INSERT INTO mydb.TesteClinico_has_Utensilio(TesteClinico_idTesteClinico, Utensilio_idUtensilio)
VALUES((SELECT idTesteclinico FROM TesteClinico 
WHERE  Agendamento_nºagendamento =((Select  nºagendamento From Agendamento where data_hora = '2012-10-11 09:30:00'))),
(SELECT idUtensilio FROM Utensilio WHERE nome='Seringa'));
INSERT INTO mydb.TesteClinico_has_Utensilio(TesteClinico_idTesteClinico, Utensilio_idUtensilio)
VALUES((SELECT idTesteclinico FROM TesteClinico 
WHERE  Agendamento_nºagendamento =((Select  nºagendamento From Agendamento where data_hora = '2019-08-23 14:00:00'))),
(SELECT idUtensilio FROM Utensilio WHERE nome='Aparelho de EletroCardioGrama'));
INSERT INTO mydb.TesteClinico_has_Utensilio(TesteClinico_idTesteClinico, Utensilio_idUtensilio)
VALUES((SELECT idTesteclinico FROM TesteClinico 
WHERE  Agendamento_nºagendamento =((Select  nºagendamento From Agendamento where data_hora = '2014-06-10 17:00:00'))),
(SELECT idUtensilio FROM Utensilio WHERE nome='Equipamento de Raio X'));
INSERT INTO mydb.TesteClinico_has_Utensilio(TesteClinico_idTesteClinico, Utensilio_idUtensilio)
VALUES((SELECT idTesteclinico FROM TesteClinico 
WHERE  Agendamento_nºagendamento =((Select  nºagendamento From Agendamento where data_hora = '2017-11-05 16:00:00'))),
(SELECT idUtensilio FROM Utensilio WHERE nome='Unidade de Refração'));

