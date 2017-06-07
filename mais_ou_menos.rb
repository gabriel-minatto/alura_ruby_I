def da_boas_vindas
    puts
    puts "        P  /_\  P                              "
    puts "       /_\_|_|_/_\                             "
    puts "   n_n | ||. .|| | n_n         Bem vindo ao    "
    puts "   |_|_|nnnn nnnn|_|_|     Jogo de Adivinhação!"
    puts "  |' '  |  |_|  |'  ' |                        "
    puts "  |_____| ' _ ' |_____|                        " 
    puts "        \__|_|__/                              "
    puts
    puts "Qual é o seu nome?"
    nome = gets.strip
    puts "\n\n\n\n\n\n"
    #puts "Começaremos o jogo para você, "+nome
    puts "Começaremos o jogo para você, #{nome}"
    nome
end

def pede_dificuldade
    puts "Qual o nível de dificuldade?"
    puts "(1) Muito fácil (2) Fácil (3) Normal (4) Difícil (5) Impossível"
    puts "Escolha: "
    dificuldade = gets.to_i
end

def sorteia_numero_secreto(dificuldade)
    case dificuldade
    when 1
        maximo = 30
    when 2
        maximo = 60
    when 3
        maximo = 100
    when 4
        maximo = 150
    else
        maximo = 200
    end
    puts "Escolhendo um número secreto entre 1 e #{maximo}..."
    sorteado = rand maximo + 1
    puts "Escolhido...que tal adivinhar hoje o nosso número secreto?"
    sorteado
end

def pede_um_numero(chutes,tentativa,limite_de_tentativas)
    puts "\n\n\n\n"
    #puts "Tentativa "+tentativa.to_s+" de "+ limite_de_tentativas.to_s
    puts "Tentativa #{tentativa} de #{limite_de_tentativas}" #interpolação
    #for cont in 0..tentativa-2 do
        #puts "Chutes até agora "+chutes[cont].to_s
    #end
    #puts "Chutes até agora "+chutes.to_s
    puts "Chutes até agora #{chutes.to_s}"
    puts "Entre com o número"
    chute = gets.strip
    #puts "Será que acertou? Você chutou "+chute
    puts "Será que acertou? Você chutou #{chute}"
    chute.to_i #return
end

def ganhou
  puts
  puts "             OOOOOOOOOOO               "
  puts "         OOOOOOOOOOOOOOOOOOO           "
  puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
  puts "    OOOOOO      OOOOO      OOOOOO      "
  puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
  puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
  puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
  puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
  puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
  puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
  puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
  puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
  puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
  puts "         OOOOOO         OOOOOO         "
  puts "             OOOOOOOOOOOO              "
  puts
  puts "               Acertou!                "
  puts
end

def verifica_se_acertou(numero_secreto,chute)
    acertou = numero_secreto == chute

    if acertou
        ganhou
        return acertou
    end

    maior = numero_secreto > chute.to_i
    if maior
        puts "O número secreto é maior"
    else
        puts "O número secreto é menor"
    end
    false #return false
end
def joga(nome,dificuldade)
    numero_secreto = sorteia_numero_secreto(dificuldade)

    pontos_ate_agora = 1000
    limite_de_tentativas = 5
    chutes = []

    for tentativa in 1..limite_de_tentativas do

        chute = pede_um_numero chutes,tentativa, limite_de_tentativas #pede_um_numero(tentativa, limite_de_tentativas)
        chutes << chute #o << coloca na ultima

        if nome == "Gabriel"
            ganhou
            break
        end

        pontos_a_perder = (chute - numero_secreto) / 2.0
        #pontos_a_perder = (chute - numero_secreto) * 0.5
        #pontos_a_perder = (chute.to_f - numero_secreto) / 2
        #unless pontos_a_perder > 0 #contrario de if
        #    pontos_a_perder *= -1
        #end
        pontos_ate_agora -= pontos_a_perder.abs #abs devolve o numero absoluto, sem sinal

        #chutes[chutes.size] = chute
        #chutes[tentativa - 1] = chute
        if verifica_se_acertou numero_secreto, chute
            break
        end
        #break if verifica_se_acertou numero_secreto, chute
    end

    puts "Vocês ganhou #{pontos_ate_agora} pontos."
    puts "O número era #{numero_secreto}"
=begin
    comentario de varias linhas
    linhas
=end

    #comentario de uma linha
end
def quer_jogar
    puts "Desejar jogar novamente? (S/N)"
    quero_jogar = gets.strip
    quero_jogar.upcase == "S"
end

nome = da_boas_vindas
dificuldade = pede_dificuldade

loop do
    joga nome, dificuldade
    if !quer_jogar
        break
    end
end