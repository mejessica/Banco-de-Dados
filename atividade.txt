
CREATE TABLE "Cliente"(
	cpf char(11),
	nome varchar (100),
	telefone char (11),
	CONSTRAINT "ClientePK" PRIMARY KEY ("cpf") 	
)
SELECT * FROM "Cliente";

CREATE TABLE "Empregado" (
	cpf char(11),
	nome varchar(100),
	cargo varchar(100),
	CONSTRAINT "EmpregadoPK" PRIMARY KEY ("cpf")
)
SELECT * FROM "Empregado";

CREATE TABLE "projeto"(
	codProj int,
	nome varchar(100),
	descricao text,
	preco float, not null
	"dtFim" date,
	"dtEstimada" date, not null
	dtSolicitacao date,
	"cpfGerente" char(11),
	"cpfCliente" char (11),
	
	CONSTRAINT "codProjPK" PRIMARY KEY (codProj),
	CONSTRAINT "cpfClienteFK" FOREIGN KEY ("cpfCliente") 
		REFERENCES "Cliente" (cpf)
		ON DELETE SET NULL
		ON UPDATE NO ACTION,
	
	CONSTRAINT "cpfGerenteFK" FOREIGN KEY ("cpfGerente")
		REFERENCES "Empregado" (cpf)
		ON DELETE SET NULL
		ON UPDATE NO ACTION
)
SELECT * FROM "projeto";

CREATE TABLE "projEmp" (
	"codProj" int,
	"cpfEmpregado" char (14),
	hrTab interval, not null
	
	CONSTRAINT "projEmpPK" PRIMARY KEY ("codProj", "cpfEmpregado"),
	CONSTRAINT "cpfEmpregadoFK" FOREIGN KEY ("cpfEmpregado")
		REFERENCES "Empregado" (cpf)
		ON DELETE SET NULL
		ON UPDATE NO ACTION,
	
	CONSTRAINT "codProjFK" FOREIGN KEY ("codProj")
		REFERENCES projeto (codProj)
		ON DELETE SET NULL
		ON UPDATE NO ACTION
)
SELECT * FROM "projEmp";


ALTER TABLE "Empregado" RENAME TO empregados;
ALTER TABLE "Cliente" ADD COLUMN "RG" char (10);
ALTER TABLE projeto ALTER COLUMN "preco" type numeric(12,2);
ALTER TABLE "Cliente" ADD CONSTRAINT RG UNIQUE ("RG");
CREATE SEQUENCE sequencia
SELECT nextval ('sequencia');
SELECT currval ('sequencia');
ALTER TABLE projeto ALTER COLUMN codProj SET DEFAULT nextval ('sequencia');
