def da_boas_vindas
    puts "Bem vindo ao jogo da adivinhação"
    puts "Qual é o seu nome?"
    nome = gets.strip
    puts "\n\n\n\n\n\n"
    #puts "Começaremos o jogo para você, "+nome
    puts "Começaremos o jogo para você, #{nome}"
end

def sorteia_numero_secreto
    puts "Escolhendo um número secreto entre 0 e 200..."
    sorteado = 175
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

def verifica_se_acertou(numero_secreto,chute)
    acertou = numero_secreto == chute

    if acertou
        puts "Acertou!"
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

da_boas_vindas
numero_secreto = sorteia_numero_secreto

limite_de_tentativas = 5
chutes = []

for tentativa in 1..limite_de_tentativas do

    chute = pede_um_numero chutes,tentativa, limite_de_tentativas #pede_um_numero(tentativa, limite_de_tentativas)
    chutes << chute #o << coloca na ultima
    #chutes[chutes.size] = chute
    #chutes[tentativa - 1] = chute
    if verifica_se_acertou numero_secreto, chute
        break
    end
    #break if verifica_se_acertou numero_secreto, chute
end
=begin
 comentario de varias linhas
 linhas
=end

#comentario de uma linha