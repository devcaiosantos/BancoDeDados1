DROP DATABASE IF EXISTS mercado;
CREATE DATABASE IF NOT EXISTS mercado;
USE mercado;

CREATE TABLE IF NOT EXISTS SECAO (
  numero_secao INTEGER,
  titulo VARCHAR(60) NOT NULL,
  localizacao VARCHAR(60) NOT NULL,
  PRIMARY KEY(numero_secao)
);

CREATE TABLE IF NOT EXISTS  SETOR (
  id_setor VARCHAR(60) ,
  nome_setor VARCHAR(60) NOT NULL,
  chefe VARCHAR(60)  NOT NULL,
  PRIMARY KEY(id_setor)
);

CREATE TABLE IF NOT EXISTS FUNCIONARIO (
  id VARCHAR(14),
  nome VARCHAR(60) NOT NULL,
  salario DOUBLE NOT NULL,
  numero_secao INTEGER,
  id_setor VARCHAR(60),
  CONSTRAINT fk_numero_secao1 FOREIGN KEY(numero_secao) REFERENCES SECAO(numero_secao),
  CONSTRAINT fk_id_setor FOREIGN KEY(id_setor) REFERENCES SETOR(id_setor),
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS  PESSOA_FISICA (
  cpf VARCHAR(14),
  num_carteira VARCHAR(11) NOT NULL,
  id CHAR(14),
  PRIMARY KEY(cpf,id),
  CONSTRAINT fk_id FOREIGN KEY(id) REFERENCES FUNCIONARIO(id)
);

CREATE TABLE IF NOT EXISTS  PESSOA_JURIDICA (
  cnpj VARCHAR(14),
  nome_fantasia VARCHAR(60),
  id CHAR(14),
  PRIMARY KEY(cnpj,id),
  CONSTRAINT fk_id1 FOREIGN KEY(id) REFERENCES FUNCIONARIO(id)
);

CREATE TABLE IF NOT EXISTS  DEPENDENTE (
  cpf VARCHAR(14),
  idade INTEGER NOT NULL,
  parentesco VARCHAR(60) NOT NULL,
  id VARCHAR(14),
  PRIMARY KEY(cpf,id),
  CONSTRAINT fk_id2 FOREIGN KEY(id) REFERENCES FUNCIONARIO(id)
);

CREATE TABLE IF NOT EXISTS  PRATELEIRA (
  numero_prateleira INTEGER,
  espaco INTEGER NOT NULL,
  numero_secao INTEGER,
  CONSTRAINT fk_numero_secao2 FOREIGN KEY(numero_secao) REFERENCES SECAO(numero_secao),
  PRIMARY KEY(numero_prateleira)
);

CREATE TABLE IF NOT EXISTS  FORNECEDOR (
  cnpj  VARCHAR(14),
  nome  VARCHAR(60) NOT NULL,
  endereco VARCHAR(120) NOT NULL,
  PRIMARY KEY(cnpj)
);

CREATE TABLE IF NOT EXISTS  RESPONSAVEL (
  cpf VARCHAR(14),
  email VARCHAR(60) NOT NULL,
  telefone VARCHAR(14) NOT NULL,
  cnpj VARCHAR(14),
  PRIMARY KEY(cpf,cnpj),
  CONSTRAINT fk_cnpj1 FOREIGN KEY(cnpj) REFERENCES FORNECEDOR(cnpj)
);

-- Quilo, Centímetros, Unidade
CREATE TABLE IF NOT EXISTS  UNIDADE_MEDIDA (
  id INTEGER,
  sigla CHAR(2) NOT NULL,
  nome VARCHAR(60) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS  PRODUTO (
  cod_barras VARCHAR(13),
  preco DOUBLE NOT NULL,
  nome VARCHAR(60) NOT NULL,
  numero_prateleira INTEGER,
  cnpj VARCHAR(14),
  id INTEGER,
  CONSTRAINT fk_numero_prateleira FOREIGN KEY(numero_prateleira) REFERENCES PRATELEIRA(numero_prateleira),
  CONSTRAINT fk_cnpj2 FOREIGN KEY(cnpj) REFERENCES FORNECEDOR(cnpj),
  CONSTRAINT fk_id3 FOREIGN KEY(id) REFERENCES UNIDADE_MEDIDA(id),
  PRIMARY KEY(cod_barras)
);

CREATE TABLE IF NOT EXISTS  CLIENTE (
  cpf VARCHAR(14),
  cartao_fidelidade VARCHAR(40) NOT NULL,
  nome VARCHAR(40) NOT NULL,
  PRIMARY KEY(cpf)
);

CREATE TABLE IF NOT EXISTS  CLIENTE_PRODUTO (
  desconto DOUBLE,
  cod_barras VARCHAR(13),
  cpf VARCHAR(14),
  PRIMARY KEY(cod_barras,cpf), 
  CONSTRAINT fk_cod_barras FOREIGN KEY(cod_barras) REFERENCES PRODUTO(cod_barras),
  CONSTRAINT fk_cpf FOREIGN KEY(cpf) REFERENCES CLIENTE(cpf)
);

-- Inserts no DATABASE mercado

-- SECAO
INSERT INTO SECAO(numero_secao,titulo,localizacao) VALUES (1,"Higiene","Corredor 1, primeiro andar");
INSERT INTO SECAO(numero_secao,titulo,localizacao) VALUES (2,"Padaria","Corredor 2, primeiro andar");
INSERT INTO SECAO(numero_secao,titulo,localizacao) VALUES (3,"Açogue","Corredor 3, primeiro andar");
INSERT INTO SECAO(numero_secao,titulo,localizacao) VALUES (4,"Festa & Cia","Corredor 4, primeiro andar");
INSERT INTO SECAO(numero_secao,titulo,localizacao) VALUES (5,"Ortifruti","Corredor 4, primeiro andar");
INSERT INTO SECAO(numero_secao,titulo,localizacao) VALUES (6,"Casa & Cozinha","Corredor 1, segundo andar");
INSERT INTO SECAO(numero_secao,titulo,localizacao) VALUES (7,"Moda Feminina","Corredor 2, segundo andar");
INSERT INTO SECAO(numero_secao,titulo,localizacao) VALUES (8,"Moda Masculina","Corredor 3, segundo andar");
INSERT INTO SECAO(numero_secao,titulo,localizacao) VALUES (9,"Frios","Corredor 4, segundo andar");
INSERT INTO SECAO(numero_secao,titulo,localizacao) VALUES (10,"Eletrônicos","Corredor 5, segundo andar");

-- SETOR
INSERT INTO SETOR(id_setor,nome_setor,chefe) VALUES ("#1","Empacotadores","Rodolfo");
INSERT INTO SETOR(id_setor,nome_setor,chefe) VALUES ("#2","Açougueiros","João");
INSERT INTO SETOR(id_setor,nome_setor,chefe) VALUES ("#3","Faxineiros","Juan");
INSERT INTO SETOR(id_setor,nome_setor,chefe) VALUES ("#4","Caixas","Rosana");
INSERT INTO SETOR(id_setor,nome_setor,chefe) VALUES ("#5","Repositores","Clayton");
INSERT INTO SETOR(id_setor,nome_setor,chefe) VALUES ("#6","Seguranças","Otávio");
INSERT INTO SETOR(id_setor,nome_setor,chefe) VALUES ("#7","Recursos Humanos","Rodrigo");
INSERT INTO SETOR(id_setor,nome_setor,chefe) VALUES ("#8","Cartazistas","Ivana");
INSERT INTO SETOR(id_setor,nome_setor,chefe) VALUES ("#9","Contabilidade","Marcos");
INSERT INTO SETOR(id_setor,nome_setor,chefe) VALUES ("#10","Vendedor","Cleber");

-- FUNCIONARIO
INSERT INTO FUNCIONARIO(id,nome,salario,id_setor) VALUES ("@1","Rodolfo","5400.00","#1");
INSERT INTO FUNCIONARIO(id,nome,salario,numero_secao,id_setor) VALUES ("@2","João","1400.00",3,"#2");
INSERT INTO FUNCIONARIO(id,nome,salario,id_setor) VALUES ("@3","Juan","2400.00","#3");
INSERT INTO FUNCIONARIO(id,nome,salario,id_setor) VALUES ("@4","Rosana","1300.00","#4");
INSERT INTO FUNCIONARIO(id,nome,salario,numero_secao,id_setor) VALUES ("@5","Clayton","2200.00",5,"#5");
INSERT INTO FUNCIONARIO(id,nome,salario,numero_secao,id_setor) VALUES ("@6","Otávio","1200.00",10,"#6");
INSERT INTO FUNCIONARIO(id,nome,salario,id_setor) VALUES ("@7","Rodrigo","4500.00","#7");
INSERT INTO FUNCIONARIO(id,nome,salario,id_setor) VALUES ("@8","Ivana","3300.00","#8");
INSERT INTO FUNCIONARIO(id,nome,salario,id_setor) VALUES ("@9","Marcos","2400.00","#9");
INSERT INTO FUNCIONARIO(id,nome,salario,numero_secao,id_setor) VALUES ("@10","Cleber","3400.00",2,"#10");

-- PESSOA_FISICA
INSERT INTO PESSOA_FISICA(cpf,num_carteira,id) VALUES ("51826684069","77832339545","@1");
INSERT INTO PESSOA_FISICA(cpf,num_carteira,id) VALUES ("39161023035","44776964382","@2");
INSERT INTO PESSOA_FISICA(cpf,num_carteira,id) VALUES ("11922566039","07399357790","@3");
INSERT INTO PESSOA_FISICA(cpf,num_carteira,id) VALUES ("52397636077","05195568428","@4");
INSERT INTO PESSOA_FISICA(cpf,num_carteira,id) VALUES ("54068455007","42521479997","@5");
INSERT INTO PESSOA_FISICA(cpf,num_carteira,id) VALUES ("23941471058","66054392716","@6");
INSERT INTO PESSOA_FISICA(cpf,num_carteira,id) VALUES ("71765495083","03902897955","@7");
INSERT INTO PESSOA_FISICA(cpf,num_carteira,id) VALUES ("18244245077","51471721640","@8");
INSERT INTO PESSOA_FISICA(cpf,num_carteira,id) VALUES ("53822288098","56579112638","@9");
INSERT INTO PESSOA_FISICA(cpf,num_carteira,id) VALUES ("89270846083","83094500870","@10");

-- PESSOA_JURIDICA
INSERT INTO PESSOA_JURIDICA(cnpj,nome_fantasia,id) VALUES ("91057190000139","Ronald PC","@1");
INSERT INTO PESSOA_JURIDICA(cnpj,nome_fantasia,id) VALUES ("23742562000106","Katie Ok","@2");
INSERT INTO PESSOA_JURIDICA(cnpj,nome_fantasia,id) VALUES ("33844838000110","Tony Below","@3");
INSERT INTO PESSOA_JURIDICA(cnpj,nome_fantasia,id) VALUES ("47894828000102","Tworus bango","@4");
INSERT INTO PESSOA_JURIDICA(cnpj,nome_fantasia,id) VALUES ("10989734000107","Tworus bago","@5");
INSERT INTO PESSOA_JURIDICA(cnpj,nome_fantasia,id) VALUES ("31363725000178","Kacije","@6");
INSERT INTO PESSOA_JURIDICA(cnpj,nome_fantasia,id) VALUES ("08449322000124","Elieit","@7");
INSERT INTO PESSOA_JURIDICA(cnpj,nome_fantasia,id) VALUES ("62251027000104","Cabesy","@8");
INSERT INTO PESSOA_JURIDICA(cnpj,nome_fantasia,id) VALUES ("27829511000177","Mewoh","@9");
INSERT INTO PESSOA_JURIDICA(cnpj,nome_fantasia,id) VALUES ("13055878000176","Tapahty","@10");

-- DEPENDENTE
INSERT INTO DEPENDENTE(cpf,idade,parentesco,id) VALUES("71841535028", 14, "Filho","@1");
INSERT INTO DEPENDENTE(cpf,idade,parentesco,id) VALUES("71841535028", 33, "Conjuge","@2");
INSERT INTO DEPENDENTE(cpf,idade,parentesco,id) VALUES("71841535028", 18, "Filho","@3");
INSERT INTO DEPENDENTE(cpf,idade,parentesco,id) VALUES("71841535028", 23, "Conjuge","@4");
INSERT INTO DEPENDENTE(cpf,idade,parentesco,id) VALUES("71841535028", 34, "Conjuge","@5");
INSERT INTO DEPENDENTE(cpf,idade,parentesco,id) VALUES("71841535028", 12, "Filho","@6");
INSERT INTO DEPENDENTE(cpf,idade,parentesco,id) VALUES("71841535028", 14, "Filho","@7");
INSERT INTO DEPENDENTE(cpf,idade,parentesco,id) VALUES("71841535028", 25, "Conjuge","@8");
INSERT INTO DEPENDENTE(cpf,idade,parentesco,id) VALUES("71841535028", 11, "Filho","@9");
INSERT INTO DEPENDENTE(cpf,idade,parentesco,id) VALUES("71841535028", 9, "Filho","@10");

-- PRATELEIRA
INSERT INTO PRATELEIRA(numero_prateleira,espaco,numero_secao) VALUES(1, 12,1);
INSERT INTO PRATELEIRA(numero_prateleira,espaco,numero_secao) VALUES(2, 11,2);
INSERT INTO PRATELEIRA(numero_prateleira,espaco,numero_secao) VALUES(3, 9,3);
INSERT INTO PRATELEIRA(numero_prateleira,espaco,numero_secao) VALUES(4, 23,4);
INSERT INTO PRATELEIRA(numero_prateleira,espaco,numero_secao) VALUES(5, 14,5);
INSERT INTO PRATELEIRA(numero_prateleira,espaco,numero_secao) VALUES(6, 16,6);
INSERT INTO PRATELEIRA(numero_prateleira,espaco,numero_secao) VALUES(7, 15,7);
INSERT INTO PRATELEIRA(numero_prateleira,espaco,numero_secao) VALUES(8, 4,8);
INSERT INTO PRATELEIRA(numero_prateleira,espaco,numero_secao) VALUES(9, 2,9);
INSERT INTO PRATELEIRA(numero_prateleira,espaco,numero_secao) VALUES(10, 11,10);
  
-- FORNECEDOR
INSERT INTO FORNECEDOR(cnpj,nome,endereco)VALUES("80957504000133", "Rogério Enlatados","Avenida Rio Branco,1225");
INSERT INTO FORNECEDOR(cnpj,nome,endereco)VALUES("78579617000109", "Omar Frios","Rua José fonseca,25");
INSERT INTO FORNECEDOR(cnpj,nome,endereco)VALUES("83366470000109", "Air Clean","Avenida Tubarão branco,44");
INSERT INTO FORNECEDOR(cnpj,nome,endereco)VALUES("39614998000150", "Ambev","Avenida Tupiniquin,230");
INSERT INTO FORNECEDOR(cnpj,nome,endereco)VALUES("99979196000175", "Claim Key","Rua Radio Teles,1230");
INSERT INTO FORNECEDOR(cnpj,nome,endereco)VALUES("92512271000144", "Samsung","Avenida Ruralista,224");
INSERT INTO FORNECEDOR(cnpj,nome,endereco)VALUES("00963006000164", "Apple","Avenida Rio Branco,274");
INSERT INTO FORNECEDOR(cnpj,nome,endereco)VALUES("30816474000177", "Ortifruit Europa","Rua Papagaio Branco,23");
INSERT INTO FORNECEDOR(cnpj,nome,endereco)VALUES("76259037000109", "Cassios Derby","Avenida Das Alamedas,57");
INSERT INTO FORNECEDOR(cnpj,nome,endereco)VALUES("63969767000143", "Elma Chips","Rua da Paz,14");

-- RESPONSAVEL
INSERT INTO RESPONSAVEL(cpf,telefone,cnpj,email) VALUES("62607794021","(63) 2975-4427","80957504000133", "ahmrusalf@mexcool.com");
INSERT INTO RESPONSAVEL(cpf,telefone,cnpj,email) VALUES("87152609098","(86) 2275-3479","78579617000109","scottie_mccarthy@outlook.com");
INSERT INTO RESPONSAVEL(cpf,telefone,cnpj,email) VALUES("96900891020","(84) 3176-2460","83366470000109","willian_waters@gmail.com");
INSERT INTO RESPONSAVEL(cpf,telefone,cnpj,email) VALUES("51771672080","(17) 2372-7278","39614998000150","cyrus_lord@aol.com");
INSERT INTO RESPONSAVEL(cpf,telefone,cnpj,email) VALUES("31160944032","(49) 3684-6423","99979196000175","randolph_hill@aol.com");
INSERT INTO RESPONSAVEL(cpf,telefone,cnpj,email) VALUES("38008024062","(43) 2333-7761","92512271000144","chau_kouma@outlook.com");
INSERT INTO RESPONSAVEL(cpf,telefone,cnpj,email) VALUES("92771937000","(43) 2575-9534","00963006000164","ofelia_bellamy@yahoo.com");
INSERT INTO RESPONSAVEL(cpf,telefone,cnpj,email) VALUES("32152305000","(88) 3531-9732","30816474000177","gerardo_small@protonmail.com");
INSERT INTO RESPONSAVEL(cpf,telefone,cnpj,email) VALUES("97248602051","(92) 3177-6681","76259037000109","manuel_regan@aol.com");
INSERT INTO RESPONSAVEL(cpf,telefone,cnpj,email) VALUES("83222731004","(33) 3895-5821","63969767000143","sharla_kirk@gmail.com");

-- UNIDADE_MEDIDA
INSERT INTO UNIDADE_MEDIDA(id,sigla,nome) VALUES(1,"CM","CENTÍMETROS");
INSERT INTO UNIDADE_MEDIDA(id,sigla,nome) VALUES(2,"M","METROS");
INSERT INTO UNIDADE_MEDIDA(id,sigla,nome) VALUES(3,"KG","QUILOS");
INSERT INTO UNIDADE_MEDIDA(id,sigla,nome) VALUES(4,"UN","UNIDADE");
INSERT INTO UNIDADE_MEDIDA(id,sigla,nome) VALUES(5,"G","GRAMAS");
INSERT INTO UNIDADE_MEDIDA(id,sigla,nome) VALUES(6,"LB","LIBRAS");
INSERT INTO UNIDADE_MEDIDA(id,sigla,nome) VALUES(7,"ML","MILILITROS");
INSERT INTO UNIDADE_MEDIDA(id,sigla,nome) VALUES(8,"DU","UMA DÚZIA");
INSERT INTO UNIDADE_MEDIDA(id,sigla,nome) VALUES(9,"m2", "METRO QUADRADO");
INSERT INTO UNIDADE_MEDIDA(id,sigla,nome) VALUES(10,"L", "LITROS");

-- PRODUTO
INSERT INTO PRODUTO(cod_barras,preco,nome,numero_prateleira,cnpj,id) VALUES("8367495037", 12.5, "DANONE",1,"80957504000133",1); 
INSERT INTO PRODUTO(cod_barras,preco,nome,numero_prateleira,cnpj,id) VALUES("8969202536", 23.4, "PANETONE",2,"78579617000109",2); 
INSERT INTO PRODUTO(cod_barras,preco,nome,numero_prateleira,cnpj,id) VALUES("28824315462", 33.2, "PAO DE ALHO",3,"83366470000109",3); 
INSERT INTO PRODUTO(cod_barras,preco,nome,numero_prateleira,cnpj,id) VALUES("77161647983", 23.0, "NUTELA",4,"39614998000150",4); 
INSERT INTO PRODUTO(cod_barras,preco,nome,numero_prateleira,cnpj,id) VALUES("84277121526", 29.5, "PAÇOCA",5,"99979196000175",5); 
INSERT INTO PRODUTO(cod_barras,preco,nome,numero_prateleira,cnpj,id) VALUES("09951344165", 120.0, "JOGO DE PRATO",6,"92512271000144",6);
INSERT INTO PRODUTO(cod_barras,preco,nome,numero_prateleira,cnpj,id) VALUES("12576012456", 88.0, "TAPETE",7,"00963006000164",7); 
INSERT INTO PRODUTO(cod_barras,preco,nome,numero_prateleira,cnpj,id) VALUES("34737163856", 21.0, "CORTINA",8,"30816474000177",8); 
INSERT INTO PRODUTO(cod_barras,preco,nome,numero_prateleira,cnpj,id) VALUES("58010374915", 5.99, "TRIDENT",9,"76259037000109",9); 
INSERT INTO PRODUTO(cod_barras,preco,nome,numero_prateleira,cnpj,id) VALUES("41893782867", 3.99, "BALA",10,"63969767000143",10); 

-- CLIENTE
INSERT INTO CLIENTE (cpf,cartao_fidelidade,nome) VALUES("14452182089","79543974593","Arlindo");
INSERT INTO CLIENTE (cpf,cartao_fidelidade,nome) VALUES("98086062023","2189612522","Bruno");
INSERT INTO CLIENTE (cpf,cartao_fidelidade,nome) VALUES("92322418030","4335006192","Carlos");
INSERT INTO CLIENTE (cpf,cartao_fidelidade,nome) VALUES("91403890064","62339296912","Maicon");
INSERT INTO CLIENTE (cpf,cartao_fidelidade,nome) VALUES("67891614067","029787353","Dalton");
INSERT INTO CLIENTE (cpf,cartao_fidelidade,nome) VALUES("53861018039","181591118","Elisangela");
INSERT INTO CLIENTE (cpf,cartao_fidelidade,nome) VALUES("77796830017","6239811957","Fagner");
INSERT INTO CLIENTE (cpf,cartao_fidelidade,nome) VALUES("65063998054","209865937","Gabriel");
INSERT INTO CLIENTE (cpf,cartao_fidelidade,nome) VALUES("15865514008","057151691","Hubner");
INSERT INTO CLIENTE (cpf,cartao_fidelidade,nome) VALUES("56713051014","3464132494","Iago");

-- CLIENTE_PRODUTO

INSERT INTO CLIENTE_PRODUTO(desconto,cod_barras, cpf) VALUES(0.05,"8367495037","14452182089");
INSERT INTO CLIENTE_PRODUTO(desconto,cod_barras, cpf) VALUES(0.10,"8969202536","98086062023");
INSERT INTO CLIENTE_PRODUTO(desconto,cod_barras, cpf) VALUES(0.25,"28824315462","92322418030");
INSERT INTO CLIENTE_PRODUTO(desconto,cod_barras, cpf) VALUES(0.04,"77161647983","91403890064");
INSERT INTO CLIENTE_PRODUTO(desconto,cod_barras, cpf) VALUES(0.03,"84277121526","67891614067");
INSERT INTO CLIENTE_PRODUTO(desconto,cod_barras, cpf) VALUES(0.12,"09951344165","53861018039");
INSERT INTO CLIENTE_PRODUTO(desconto,cod_barras, cpf) VALUES(0.15,"12576012456","77796830017");
INSERT INTO CLIENTE_PRODUTO(desconto,cod_barras, cpf) VALUES(0.15,"34737163856","65063998054");
INSERT INTO CLIENTE_PRODUTO(desconto,cod_barras, cpf) VALUES(0.35,"58010374915","15865514008");
INSERT INTO CLIENTE_PRODUTO(desconto,cod_barras, cpf) VALUES(0.22,"41893782867","56713051014");
