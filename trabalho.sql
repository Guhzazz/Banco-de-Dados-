create table Aluno(
nome varchar(30),
matricula integer not null,
id_aluno integer not null primary key,
curso varchar(30),
email varchar(30),
telefone int
);

create table Autor(
nome varchar(30),
id_autor integer not null primary key,
nacionalidade varchar(30)
);

create table Editora(
id_editora int not null primary key,
nome varchar(30),
cidade varchar(30),
país varchar(30)
);

create table Funcionario(
id_funcionario int not null primary key,
nome varchar(30),
cargo varchar(30),
email varchar(30),
telefone integer
);

create table Livro(
id_livro int not null primary key,
ano_pub date,
titulo varchar(30),
id_editora integer not null,
foreign key (id_editora) references Editora(id_editora)
);

create table LivroAutor(
id_livro integer not null,
id_autor integer not null,

foreign key(id_livro) references Livro(id_livro),
foreign key(id_autor) references Autor(id_autor),
primary key(id_livro, id_autor)
);


 create table Emprestimo(
id_emprestimo integer not null primary key,
data_emp date,
data_prevista date,
id_aluno integer not null,
id_funcionario integer not null,

foreign key(id_aluno) references Aluno(id_aluno),
foreign key(id_funcionario) references Funcionario(id_funcionario)
);

create table Exemplar(
id_exemplar integer not null primary key,
estado_conservacao varchar(30),
disponibilidade boolean,
id_livro integer not null,

foreign key (id_livro) references Livro(id_livro)
);

create table ItemEmprestimo(
multa decimal(10, 2),
data_dev date,
id_exemplar integer not null,
id_emprestimo integer not null,

foreign key (id_exemplar) references Exemplar(id_exemplar),
foreign key(id_emprestimo) references Emprestimo(id_emprestimo),
primary key(data_dev, id_exemplar, id_emprestimo)
);
