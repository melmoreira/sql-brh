-- atividades semana03 - MelissaMMS

--Inserir novo colaborador

--Papel: 
INSERT INTO brh.papel (id, nome) 
VALUES (8, 'Especialista de Neg�cios');

--Projeto:
INSERT INTO brh.projeto (id, nome, responsavel, inicio, fim)
VALUES (5, BI, 'L123', to_date('2023-11-14', 'yyyy-mm-dd'), to_date('2024-08-25', 'yyyy-mm-dd'));

-- Colaborador:
INSERT INTO brh.colaborador (matricula, cpf, nome, salario, departamento, cep, logradouro)
VALUES ('F124', '186.988.345-07', 'Fulano de Tal', 5000.00, 'SEDES', '14788-000', 'Rua ABC');

-- Endere�o: 
INSERT INTO brh.endereco (cep, uf, cidade, bairro)
VALUES ('14788-000', SP, Barretos, 'Centro');


-- Telefone:
INSERT INTO brh.telefone_colaborador (numero, colaborador, tipo)
VALUES ('(61) 99999-9999', F124, 'C'),
       ('(61) 3030-4040', 'F124', 'R');

-- E-mail:
INSERT INTO brh.email_colaborador (email, colaborador, tipo)
VALUES ('fulano@email.com', 'F124', 'P'),
       ('fulano.tal@brh.com', 'F124', 'T');

-- Dependentes:
INSERT INTO brh.dependente (cpf, nome, data_nascimento, parentesco, colaborador)
VALUES ('675.584.345-87', 'Beltrana de Tal', to_date('2021-07-01', 'yyyy-mm-dd'), 'Filho(a)', 'F124'),
('132.435.456-66', 'Cicrana de Tal', to_date('1982-11-21', 'yyyy-mm-dd'), 'C�njuge', 'F124');

-- Atribui��o:
INSERT INTO brh.atribuicao (projeto, colaborador, papel) 
VALUES (5, 'F124', 8);


-- Relat�rio de c�njuges
SELECT c.matricula AS matricula_colaborador, d.nome AS nome_dependente, d.data_nascimento AS data_nascimento_dependente
FROM brh.colaborador c
JOIN brh.dependente d ON c.matricula = d.colaborador
WHERE PARENTESCO='Conjuge';


-- Relat�rio de contatos telef�nicos

SELECT c.matricula AS matricula_colaborador, tc.numero AS telefone, tc.tipo AS tipo
FROM brh.colaborador c
JOIN brh.telefone_colaborador tc  ON c.matricula = tc.colaborador 
WHERE tc.tipo ='M' OR  tc.tipo ='C' ORDER BY c.matricula;


-- Listar colaborador com maior sal�rio
SELECT c.nome AS nome_colaborador, 
c.salario AS salario_colaborador
FROM brh.colaborador c
WHERE c.salario = (SELECT MAX(salario) FROM brh.colaborador);







