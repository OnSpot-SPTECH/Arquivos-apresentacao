CREATE DATABASE metricas;
USE metricas;

create table sensores(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, dht11_umidade float, dht11_temperatura DEC (3.3), lm35_temperatura DEC (3.3), luminosidade DEC (4.3),  chave INT
);
drop table sensores;

select * from sensores;
