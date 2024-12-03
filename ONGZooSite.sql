CREATE DATABASE IF NOT EXISTS ONG;
USE ONG;

CREATE TABLE IF NOT EXISTS Animal(
	idAnimal int primary key not null auto_increment,
	nome varchar(50) not null,
	especie varchar(50) not null,
	idade int,
	dataResgate date not null,
	valorApadrinhamento decimal(7,2),
	historia varchar(150),
	statusSaude varchar(20) 
);

CREATE TABLE IF NOT EXISTS Denuncia(
	idDenuncia int primary key not null auto_increment,
	idUsuarioPessoa int not null,
    	idAnimal int not null,
	statusDenuncia varchar(20),
	localizacaoDenuncia varchar(50) not null,
	descricaoDenuncia varchar(100),
   	foreign key (idAnimal) references Animal(idAnimal)
);

CREATE TABLE IF NOT EXISTS VisitasApadrinhadas(
	idVisita int primary key not null auto_increment,
	idUsuarioPessoa int not null,
	idAnimal int not null, 
	dataVisita date not null, 
	statusVisita varchar(20) not null,
	foreign key (idUsuarioPessoa) references UsuarioPessoa(idUsuarioPessoa),
	foreign key (idAnimal) references Animal(idAnimal)
);

CREATE TABLE IF NOT EXISTS UsuarioPessoa(
	idUsuarioPesssoa int primary key not null auto_increment,
    	idPlano int,
   	idDoacao int,
	cpf varchar(14),
	telefone varchar(15) not null,
	endereco varchar(50) not null,
	email varchar(50) not null,
	foreign key(idPlano) references Plano(idPlano),
	foreign key(idDoacao) references Doacao(idDoacao)
);

CREATE TABLE IF NOT EXISTS Plano (
	idPlano int primary key not null,
	nomePlano varchar(50) not null,
	mensalidade decimal(7, 2) not null
);

CREATE TABLE IF NOT EXISTS Apoiadores(
	idApoiadores int primary key not null auto_increment,
	idPlano int not null,
    	idDoacao int not null,
    	CNPJ varchar(18),
	nomeFantasia varchar(50) not null,
	foreign key(idPlano) references Plano(idPlano),
	foreign key(idDoacao) references Doacao(idDoacao)
);

CREATE TABLE IF NOT EXISTS Doacao(
	idDoacao int primary key not null auto_increment,
	item varchar(30) not null,
	quantidade int not null,
	statusDoacao varchar(20),
    	descricao varchar(60)
);

CREATE TABLE IF NOT EXISTS Evento(
	idEvento int primary key not null auto_increment,
	nomeEvento varchar(50) not null,
	dataEvento date not null,
	descricaoEvento varchar(100)
    );

CREATE TABLE IF NOT EXISTS Adm(
	idFuncionario int primary key not null auto_increment,
	senha varchar(15) not null,
	nome varchar(50) not null,
	funcao varchar(30) not null
);
