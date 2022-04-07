DROP TABLE IF EXISTS "Cantor";
CREATE TABLE "Cantor" (
	id int,
	nome varchar(100) NOT NULL,
	CONSTRAINT "CantorPK" PRIMARY KEY (id)
)
SELECT * FROM "Cantor";

DROP TABLE IF EXISTS "Musica";
CREATE TABLE "Musica" (
	id int,
	titulo varchar(100) NOT NULL,
	letra varchar(100) NOT NULL,
	CONSTRAINT "MusicaPK" PRIMARY KEY (id)
)
SELECT * FROM "Musica";

DROP TABLE IF EXISTS "Gravacao";
CREATE TABLE "Gravacao"(
	id int,
	"idCantor" int,
	"idMusica" int,
	CONSTRAINT duracao CHECK (interval NOT NULL)) 
	
	CONSTRAINT "GravacaoPK" PRIMARY KEY(id),
	CONSTRAINT "CantorGravacaoFK" FOREIGN KEY ("idCantor")
		REFERENCES "Cantor"(id),
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT "MusicaGravacaoFK" FOREIGN KEY ("idMusica")
		REFERENCES "Musica"(id)
	ON DELETE CASCADE ON UPDATE CASCADE,
)
SELECT * FROM "Gravacao";

DROP TABLE IF EXISTS "Compositor";
CREATE TABLE "Compositor"(
	cpf char (14) UNIQUE,
	nome varchar(100) NOT NULL,
	CONSTRAINT "CompositorPK" PRIMARY KEY (cpf)
)
SELECT * FROM "Compositor";

DROP TABLE IF EXISTS "MusicaCompositor";
CREATE TABLE "MusicaCompositor"(
	idMusica int,
	"cpfCompositor" int,
	CONSTRAINT "MusicaCompositorPK" PRIMARY KEY (idMusica),
	CONSTRAINT "MusicaCompositorFK" FOREIGN KEY ("cpfCompositor")
		REFERENCES "Compositor"(cpf)
	ON DELETE CASCADE ON UPDATE CASCADE,
)
SELECT * FROM "MusicaCompositor";
