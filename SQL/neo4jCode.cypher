//Criação nodos Atleta

CREATE CONSTRAINT ON(a:Alteta) ASSERT a.idAtleta IS UNIQUE;

USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///atle.csv" AS line
CREATE(a:Atleta {idAtleta:TOINTEGER(line.idAtleta),
 Nome:line.nome,
 DataNascimento:line.dataNascimento,
 idModalidade: TOINTEGER(line.Modalidade_idModalidade),
 Telemovel: line.telemovel,
 Residencia: TOINTEGER(line.Residencia_idResidencia)
 Clube: TOINTEGER(line.Clube_idclube),
 Categoria: TOINTEGER(line.Categoria_idCategoria)});

//Criação Nodos Modalidade

CREATE CONSTRAINT ON(m:Modalidade) ASSERT m.idModalidade IS UNIQUE;    

USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///mod.csv" AS line
CREATE(m:Modalidade {idModalidade:TOINTEGER(line.idModalidade),
 Designação: line.designação});  

//Criação nodos Residencia

CREATE CONSTRAINT ON(r:Residencia) ASSERT r.idResidencia IS UNIQUE;

USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///res.csv" AS line
CREATE(r:Residencia {idResidencia:TOINTEGER(line.idResidencia),
 Morada:line.morada,
 Localidade:line.localidade,
 CodigoPostal: line.codigoPostal});

//Criação nodos Clube

CREATE CONSTRAINT ON(clu:Clube) ASSERT clu.idClube IS UNIQUE;

USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///clu.csv" AS line
CREATE(clu:Clube {idClube:TOINTEGER(line.idClube),
 Nome:line.mome,
 Sigla:line.sigla});

//Criação Nodos Categoria

CREATE CONSTRAINT ON(cat:Categoria) ASSERT cat.idCategoria IS UNIQUE;

USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///cat.csv" AS line
CREATE(cat:Categoria {idCategoria:TOINTEGER(line.idCategoria),
 Designação:line.designação});

//Criação Nodos Especialidade

CREATE CONSTRAINT ON(esp:Especialidade) ASSERT esp.idEspecialidade IS UNIQUE;

USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///esp.csv" AS line
CREATE(esp:Especialidade {idEspecialidade:TOINTEGER(line.idEspecialidade),
 Designação:line.designação});

//Criação Nodos Medico

CREATE CONSTRAINT ON(med:Medico) ASSERT med.idMedico IS UNIQUE;

USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///med.csv" AS line
CREATE(med:Medico {idMedico:TOINTEGER(line.idMedico),
 Nome:line.nome,
 DataInicioServiço:line.dataInicioServiço,
 idEspecialidade: TOINTEGER(line.Especialidade_idEspecialidade)});

//Criação Nodos Agendamento

CREATE CONSTRAINT ON(age:Agendamento) ASSERT age.nºagendamento IS UNIQUE;

USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///agen.csv" AS line
CREATE(age:Agendamento {nºagendamento:TOINTEGER(line.nºagendamento),
 DataHora:line.data_hora,
 idAtleta: TOINTEGER(line.Atleta_idAtleta),
 idMedico: TOINTEGER(line.Medico_idMedico)});

//Criação Nodos Teste Clinico

CREATE CONSTRAINT ON(test:TesteClinico) ASSERT test.idTesteClinico IS UNIQUE;

USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///tc.csv" AS line
CREATE(test:TesteClinico {idTesteClinico:TOINTEGER(line.idTesteClinico),
 Descrição:line.descrição,
 Estado:line.estado,
 Agendamento: TOINTEGER(line.Agendamento_nºagendamento)});

//Criação Nodos Utensilio

CREATE CONSTRAINT ON(uten:Utensilio) ASSERT uten.idUtensilio IS UNIQUE;

USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///ut.csv" AS line
CREATE(uten:Utensilio {idUtensilio:TOINTEGER(line.idUtensilio),
 Nome:line.nome});

//Start dos indices
CREATE INDEX ON :Atleta(idAtleta);
CREATE INDEX ON :Modalidade(idModalidade);
CREATE INDEX ON :Residencia(idResidencia);
CREATE INDEX ON :Clube(idClube);
CREATE INDEX ON :Categoria(idCategoria);
CREATE INDEX ON :Especialidade(idEspecialidade);
CREATE INDEX ON :Medico(idMedico);
CREATE INDEX ON :Agendamento(nºagendamento);
CREATE INDEX ON :Utensilio(idUtensilio);
CREATE INDEX ON :TesteClinico(idTesteClinico);

//Relacionamento
MATCH (a:Atleta),(r:Residencia)
WHERE a.Residencia=r.idResidencia
CREATE (a) -[sm:Tem]-> (r);

MATCH (a:Atleta),(cat:Categoria)
WHERE a.Categoria=cat.idCategoria
CREATE (a) -[sm:Pertence]-> (cat);

MATCH (a:Atleta),(m:Modalidade)
WHERE a.idModalidade=m.idModalidade
CREATE (a) -[sm:Pratica]-> (m);

MATCH (a:Atleta),(clu:Clube)
WHERE a.Clube=clu.idClube
CREATE (a) -[sm:Pertence]-> (clu);

MATCH (a:Atleta),(age:Agendamento)
WHERE a.idAtleta=age.idAtleta
CREATE (a) -[sm:Tem]-> (r);

MATCH (med:Medico),(age:Agendamento)
WHERE med.idMedico=age.idMedico
CREATE (med) -[sm:responsavel]-> (age);

MATCH (med:Medico),(esp:Especialidade)
WHERE med.Especialidade=esp.idEspecialidade
CREATE (med) -[sm:Tem]-> (esp);

MATCH (age:Agendamento),(test:TesteClinico)
WHERE age.nºagendamento=test.Agendamento
CREATE (age) -[sm:realizado]-> (test);

