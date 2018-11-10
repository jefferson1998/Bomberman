local sqlite3 = require("sqlite3")

path = system.pathForFile("banco.db", system.DocumentsDirectory)

function openAccessBD (path)
    return sqlite3.open(path)
end 

local db = openAccessBD(path)

local criarTabelaJogador = [[CREATE TABLE IF NOT EXISTS jogador ( idJogador INTEGER PRIMARY KEY autoincrement, nome, pontuacao INTEGER );]]
db:exec(criarTabelaJogador)

--TEM QUE CRIAR UMA FUNÇÃO QUE RECEBE UM JOGADOR E O INSERE.

--local player = jogador("Pereira", 550)

local q = [[INSERT INTO test VALUES ( NULL, "]] .. player.nome .. [[","]] .. player.pontuacao .. [[" );]]
db:exec( q )

function recuperarJogadores ()
    local jogadores = {}
    for row in db:nrows( "SELECT * FROM jogador" ) do
        jogadores[#jogadores+1] =
        {
            nome = row.nome,
            pontuacao = row.pontuacao
        }
    end
    return jogadores
end 