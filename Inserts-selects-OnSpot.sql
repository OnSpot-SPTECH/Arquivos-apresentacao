-- COMANDO PARA INSERIR DADOS NA TABELA "EMPRESA" --
INSERT INTO Empresa VALUES
(1, 'SeguroInfoTECH', 'info@techseguranca.com', 'Segurança de qualidade EIRELI', '(11)9618-9863', '11.223.344/0001-12');

-- COMANDO PARA INSERIR DADOS NA TABELA "UNIDADE CONSUMIDORA"
INSERT INTO unidade_consumidora VALUES
(null, 'Rua Piratininga', '789', 'Barcelona', 'São Caetano', 'SP', '98765-432', 1);

DESCRIBE sala_empresa;
-- COMANDO PARA INSERIR DADOS NA TABELA "SALA_EMPRESA" -- 
INSERT INTO Sala_Empresa VALUES
(null, 201, 1),
(null, 202, 1);

-- COMANDO PARA INSERIR DADOS NA TABELA "SENSOR" -- 
INSERT INTO Sensor VALUES
(null, 'LM-35', 'Temperatura','ativo', 5, 5, 5, 1),
(null, 'LM-35', 'Temperatura','ativo', 10, 5, 5, 1),
(null, 'LM-35', 'Temperatura','ativo', 15, 5, 5, 1),
(null, 'LM-35', 'Temperatura','ativo', 20, 5, 5, 2),
(null, 'LM-35', 'Temperatura','inativo', 25, 5, 5, 2);

-- COMANDO PARA INSERIR DADOS NA TABELA "SENSOR"
INSERT INTO Sensor VALUES 
(null, 'DHT-11', 'Umidade e Temperatura','ativo', 5, 15, 5, 1),
(null, 'DHT-11', 'Umidade e Temperatura','ativo', 10, 15, 5, 2),
(null, 'DHT-11', 'Umidade e Temperatura','inativo', 15, 15, 5, 1),
(null, 'DHT-11', 'Umidade e Temperatura','inativo', 20, 15, 5, 2),
(null, 'DHT-11', 'Umidade e Temperatura','ativo', 25, 15, 5, 1);

DESCRIBE dados_sensor;
-- COMANDO PARA INSERIR DADOS NA TABELA "DADOS DO SENSOR" -- 
INSERT INTO Dados_Sensor VALUES
(1, 22.00, NULL, '2023-10-19 15:16:23', 1),
(1, 22.50, NULL, '2023-10-19 15:16:23', 2),
(1, 22.00, NULL, '2023-10-19 15:16:23', 3),
(1, 23.00, NULL, '2023-10-19 15:16:23', 4),
(1, 16.00, NULL, '2023-10-20 15:17:23', 5);


INSERT INTO Dados_Sensor VALUES
(2, 22.00, 55.00, '2023-10-19 15:16:23', 1),
(3, 22.50, 54.00, '2023-10-19 15:16:23', 2),
(4, 22.50, 54.00, '2023-10-19 15:16:23', 1),
(2, 23.50, 55.00, '2023-10-19 15:16:23', 2);

SHOW TABLES;

SELECT * FROM Sensor;
SELECT * FROM Dados_Sensor;
SELECT * FROM Empresa;

-- SELECT COM JOIN "EMPRESA E UNIDADE CONSUMIDORA"
SELECT * FROM Empresa
JOIN unidade_consumidora
ON fkUnidadeEmpresa = empresa.id;

-- SELECT COM JOIN "UNIDADE CONSUMIDORA E SALA EMPRESA"
SELECT * FROM Unidade_consumidora
JOIN  Sala_empresa
ON fkSalaUnidade = Sala_Empresa.id;

-- SELECT COM JOIN "SENSOR E DADOS SENSOR"
SELECT * FROM sensor
JOIN Dados_Sensor
ON sensor.id = fkSensor;

-- SELECT COM JOIN "SENSOR, DADOS SENSOR E SALA_EMPRESA"
SELECT * FROM sensor
JOIN dados_sensor
ON sensor.id = fkSensor
JOIN sala_empresa
ON fkSalaUnidade = Sala_Empresa.id;
