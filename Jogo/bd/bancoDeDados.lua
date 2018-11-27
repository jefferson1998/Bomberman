local sqlite3 = require("sqlite3")

path = system.pathForFile("banco.db", system.DocumentsDirectory)
local db = sqlite3.open(path)

local criarTabelaJogador = [[CREATE TABLE IF NOT EXISTS jogador ( idJogador INTEGER PRIMARY KEY autoincrement, nome, vitorias INTEGER );]]
db:exec(criarTabelaJogador)

function inserir_personagem (personagem)
    local inserir = [[INSERT INTO jogador VALUES ( NULL,"]] .. personagem.nome .. [[","]] .. personagem.pontuacao .. [[" );]]
    db:exec(inserir)
end 

function deletar_personagem (personagem)
    local deletar = [[DELETE * FROM jogador WHERE nome = "]] .. personagem.nome .. [[";]]
    db:exec(deletar)
end

function alterar_nome_personagem (nomeAtual, nomePretendido)
    local alterarNome = [[UPDATE JOGADOR SET nome = "]] .. nomePretendido .. [[" WHERE nome IN ("]] .. nomeAtual .. [[");]]
    db:exec(alterarNome)
end

function recuperarJogadores ()
    local jogadores = {}
    for row in db:nrows( "SELECT * FROM jogador ORDER BY " ) do
        jogadores[#jogadores+1] =
        {
            nome = row.nome,
            pontuacao = row.pontuacao
        }
    end
    return jogadores
end 