CREATE TABLE Filmes(
	IdFilme INT PRIMARY KEY,
	Nome VARCHAR(50) NOT NULL,
	Ano INT NOT NULL, 
	Duracao INT NOT NULL
	)

CREATE TABLE Atores(
	IdAtor INT PRIMARY KEY,
	PrimeiroNome VARCHAR(20) NOT NULL,
	UltimoNome VARCHAR(20) NOT NULL,
	Genero VARCHAR(1) NOT NULL, 
	)

CREATE TABLE ElencoFilme(
	Id INT PRIMARY KEY,
	IdAtor INT,
	IdFilme INT NOT NULL,
	Papel VARCHAR(30) NOT NULL
)

CREATE TABLE FilmesGenero(
	Id INT PRIMARY KEY,
	IdGenero INT NOT NULL,
	IdFilme INT NOT NULL
	)

CREATE TABLE Generos(
	Id INT PRIMARY KEY,
	Genero VARCHAR(20) NOT NULL
	)

INSERT INTO Filmes (IdFilme, Nome, Ano, Duracao) VALUES
(1, 'De Volta para o Futuro', 1985, 116),
(2, 'Matrix', 1999, 136),
(3, 'O Senhor dos Anéis: A Sociedade do Anel', 2001, 178),
(4, 'Gladiador', 2000, 155),
(5, 'Titanic', 1997, 195),
(6, 'Jurassic Park', 1993, 127);

INSERT INTO Atores (IdAtor, PrimeiroNome, UltimoNome, Genero) VALUES
(1, 'Michael', 'J. Fox', 'M'),
(2, 'Keanu', 'Reeves', 'M'),
(3, 'Carrie-Anne', 'Moss', 'F'),
(4, 'Elijah', 'Wood', 'M'),
(5, 'Russell', 'Crowe', 'M'),
(6, 'Leonardo', 'DiCaprio', 'M'),
(7, 'Kate', 'Winslet', 'F'),
(8, 'Sam', 'Neill', 'M');

INSERT INTO ElencoFilme (Id, IdAtor, IdFilme, Papel) VALUES
(1, 1, 1, 'Marty McFly'),
(2, 2, 2, 'Neo'),
(3, 3, 2, 'Trinity'),
(4, 4, 3, 'Frodo Baggins'),
(5, 5, 4, 'Maximus'),
(6, 6, 5, 'Jack Dawson'),
(7, 7, 5, 'Rose DeWitt Bukater'),
(8, 8, 6, 'Dr. Alan Grant');

INSERT INTO Generos (Id, Genero) VALUES
(1, 'Aventura'),
(2, 'Ficção Científica'),
(3, 'Fantasia'),
(4, 'Drama'),
(5, 'Romance'),
(6, 'Ação');

INSERT INTO FilmesGenero (Id, IdGenero, IdFilme) VALUES
(1, 1, 1), -- De Volta para o Futuro → Aventura
(2, 2, 1), -- De Volta para o Futuro → Ficção Científica
(3, 2, 2), -- Matrix → Ficção Científica
(4, 6, 2), -- Matrix → Ação
(5, 3, 3), -- Senhor dos Anéis → Fantasia
(6, 1, 3), -- Senhor dos Anéis → Aventura
(7, 4, 4), -- Gladiador → Drama
(8, 6, 4), -- Gladiador → Ação
(9, 4, 5), -- Titanic → Drama
(10, 5, 5), -- Titanic → Romance
(11, 1, 6), -- Jurassic Park → Aventura
(12, 2, 6); -- Jurassic Park → Ficção Científica


SELECT * FROM Filmes

SELECT * FROM Filmes ORDER BY Ano ASC

SELECT * FROM Filmes WHERE Nome= 'De Volta para o Futuro'

SELECT * FROM Filmes WHERE Ano='1997'

SELECT * FROM Filmes WHERE Ano>'2000'

SELECT * FROM Filmes WHERE Duracao>100 AND Duracao<150 ORDER BY Duracao ASC

SELECT * FROM Filmes WHERE Ano=1997 ORDER BY Duracao DESC

SELECT PrimeiroNome,UltimoNome FROM Atores WHERE Genero='M'

SELECT PrimeiroNome,UltimoNome FROM Atores WHERE Genero='F' ORDER BY PrimeiroNome

SELECT Filmes.Nome, Generos.Genero
FROM Filmes 
JOIN FilmesGenero ON Filmes.IdFilme= FilmesGenero.IdFilme 
JOIN Generos ON Generos.Id= FilmesGenero.IdGenero 

SELECT Filmes.Nome, Generos.Genero
FROM Filmes 
JOIN FilmesGenero ON Filmes.IdFilme= FilmesGenero.IdFilme 
JOIN Generos ON Generos.Id= FilmesGenero.IdGenero 
WHERE Generos.Genero='Aventura'

SELECT Filmes.Nome, Atores.PrimeiroNome,Atores.UltimoNome, ElencoFilme.Papel
FROM Filmes JOIN ElencoFilme ON Filmes.IdFilme = ElencoFilme.IdFilme
JOIN Atores ON Atores.IdAtor = ElencoFilme.IdAtor;




