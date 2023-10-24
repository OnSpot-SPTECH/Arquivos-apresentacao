CREATE DATABASE OnSpot;
USE OnSpot;

-- TABELA PARA CONTROLE E CADASTRO DE EMPRESAS CLIENTES
CREATE TABLE Empresa(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45),
  email VARCHAR(45),
  razaoSocial VARCHAR(45),
  telefone VARCHAR(45),
  cnpj CHAR(18)
);

-- TABELA PARA CONTROLE E LOGIN DE CLEINTES 
CREATE TABLE Usuario(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(50),
  nome VARCHAR(45),
  cpf VARCHAR(18),
  senha VARCHAR(45),
  Permissao VARCHAR(30),
  fkEmpresa INT,
  CONSTRAINT chkPermissão CHECK (Permissao IN ('Administrador', 'Cliente')),
  CONSTRAINT fk_func_empresa FOREIGN KEY (fkEmpresa) REFERENCES Empresa(id)
);

CREATE TABLE Unidade_consumidora(
  idUnidade_consumidora INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  logradouro VARCHAR(60),
  numero VARCHAR(10),
  bairro VARCHAR(60),
  cidade VARCHAR(60),
  uf CHAR(2),
  cep CHAR(9),
  fkUnidadeEmpresa INT,
  CONSTRAINT fk_Unidade_Empresa FOREIGN KEY (fkUnidadeEmpresa) REFERENCES Empresa(id)
);

-- TABELA DAS SALAS DO DATA CENTER
CREATE TABLE Sala_Empresa(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  numero VARCHAR(15) ,
  fkSalaUnidade INT,
  CONSTRAINT fk_sala_unidade FOREIGN KEY (fkSalaUnidade) REFERENCES Unidade_consumidora(idUnidade_consumidora)
);

-- TABELA DOS SENSORES
CREATE TABLE Sensor(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45),
  tipo VARCHAR(45),
  status_sensor VARCHAR(45),
  pos_x INT,
  pos_y INT,
  pos_z INT,
  fkSalaEmpresa INT,
  CONSTRAINT chkstatusDoSensor CHECK(status_sensor in('ativo', 'inativo')),
  CONSTRAINT fk_sensor_sala FOREIGN KEY (fkSalaEmpresa) REFERENCES Sala_Empresa(id)
);

-- TABELA DE DADOS DO SENSOR --
CREATE TABLE Dados_Sensor(
  id INT ,
  temperatura DOUBLE,
  umidade DOUBLE,
  data_hora DATETIME,
  fkSensor int,
  primary key (fkSensor,id),
  CONSTRAINT fk_dados_sensor FOREIGN KEY (fkSensor) REFERENCES Sensor(id)
);