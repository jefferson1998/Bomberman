local sqlite3 = require("sqlite3")

local database = {}

path = system.pathForFile("banco.db", system.DocumentsDirectory)
local db = sqlite3.open(path)

local criarTabelaJogador = [[CREATE TABLE IF NOT EXISTS Jogador (vitorias INTEGER , derrotas INTEGER);]]
db:exec(criarTabelaJogador)

local inserir = [[INSERT INTO Jogador (vitorias, derrotas) VALUES (0,0);]]
db:exec(inserir)

function database:getVitorias()
    for row in db:urows('SELECT vitorias from Jogador') do
        return row
    end
    return 0
end

function database:vencedor()
    local valor = self:getVitorias() + 1
    print ("Chamei a funcao vencedor")
    print (valor)
    local script = [[UPDATE Jogador SET vitorias = ']]..valor..[[';]]

    db:exec(script)
end

function database:getDerrotas()
    for row in db:urows('SELECT derrotas from Jogador') do
        return row
    end
    return 0
end

function database:perdedor()
    local valor = self:getDerrotas() + 1
    print ("Chamei a funcao perdedor")
    print (valor)
    local script = [[UPDATE Jogador SET derrotas = ']]..valor..[[';]]

    db:exec(script)
end

return database