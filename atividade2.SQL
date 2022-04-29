--exercicio1

CREATE TABLE professor (
	cpf char (11),
	nome varchar(100),
	area varchar (100),
	CONSTRAINT "ProfessorPK" PRIMARY KEY (cpf)
)

SELECT * FROM professor;

CREATE TABLE curso (
	"codCurso" int,
	nome varchar (100),
	nivel int,
	CONSTRAINT cursopk PRIMARY KEY ("codCurso")
)
SELECT * FROM curso;

CREATE TABLE aluno (
	matricula char (10),
	nome varchar (100),
	"dataNasc" date,
	"codCurso" int,
	CONSTRAINT alunopk PRIMARY KEY (matricula),
	CONSTRAINT "codCursofk" FOREIGN KEY ("codCurso")
		REFERENCES curso ("codCurso")
	ON DELETE SET NULL ON UPDATE NO ACTION
)
SELECT * FROM aluno;

CREATE TABLE disciplina (
	"codDisciplina" int,
	nome varchar (50),
	horas interval,
	creditos int,
	"codCurso" int,
	CONSTRAINT disciplinapk PRIMARY KEY ("codDisciplina"),
	CONSTRAINT "codCursofk" FOREIGN KEY ("codCurso")
		REFERENCES curso ("codCurso")
	ON DELETE SET NULL ON UPDATE NO ACTION
)
SELECT * FROM disciplina;

DROP TABLE disciplina CASCADE

CREATE TABLE turma (
	"codTurma" int,
	semestre varchar (10),
	ano date,
	"codProfessor" char (11),
	"codDisciplina" char (10),
	CONSTRAINT turmapk PRIMARY KEY ("codTurma"),
	CONSTRAINT "codProfessorfk" FOREIGN KEY ("codProfessor")
		REFERENCES professor (cpf)
	ON DELETE SET NULL ON UPDATE NO ACTION,
	
	CONSTRAINT "codDisciplinafk" FOREIGN KEY ("codDisciplina")
		REFERENCES disciplina ("codDisciplina")
	ON DELETE SET NULL ON UPDATE NO ACTION
)
SELECT * FROM turma;

CREATE TABLE "preReq" (
	"codDisciplinaLiberada" int,
	"codDisciplinaRequisito" int,
	 CONSTRAINT "preReqfk" PRIMARY KEY ("codDisciplinaLiberada", "codDisciplinaRequisito"),
	 CONSTRAINT "disciplinaLiberadafk" FOREIGN KEY ("codDisciplinaLiberada")
		REFERENCES disciplina ("codDisciplina")
	ON DELETE SET NULL ON UPDATE NO ACTION,
	
	 CONSTRAINT "disciplinaRequisitofk" FOREIGN KEY ("codDisciplinaRequisito")
		REFERENCES disciplina ("codDisciplina")
	ON DELETE SET NULL ON UPDATE NO ACTION
)
SELECT * FROM "preReq";

CREATE TABLE "alunoTurma" (
	"codAluno" char(10),
	"codTurma" int,
	CONSTRAINT "codAlunofk" FOREIGN KEY ("codAluno")
		REFERENCES aluno (matricula)
	ON DELETE SET NULL ON UPDATE NO ACTION,
	
	CONSTRAINT "codTurmafk" FOREIGN KEY ("codTurma")
		REFERENCES turma ("codTurma")
	ON DELETE SET NULL ON UPDATE NO ACTION
)

FROM * SELECT "alunoTurma";

--exercicio2

ALTER TABLE "preReq" RENAME TO preRequisito;
ALTER TABLE aluno ADD COLUMN "RG" char(11);
ALTER TABLE professor ADD COLUMN "RG" char(11);
ALTER TABLE aluno ADD CONSTRAINT RG UNIQUE ("RG");
ALTER TABLE professor ADD CONSTRAINT RG UNIQUE ("RG");
ALTER TABLE aluno ADD COLUMN sexo char (1);
ALTER TABLE professor ADD COLUMN sexo char (1);

	CREATE DOMAIN sexo as char (1)
	CHECK (value = 'F' OR value = 'M') 

ALTER TABLE disciplina ALTER COLUMN horas SET NOT NULL;
ALTER TABLE disciplina ALTER COLUMN creditos SET NOT NULL;
CREATE SEQUENCE "codCursoSeq";
ALTER TABLE curso ALTER COLUMN "codCurso" SET DEFAULT nextval('"codCursoSeq"');


