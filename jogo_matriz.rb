tamanho = 10 # Define o tamanho da matriz (10x10)

# Função que gera uma posição aleatória dentro da matriz
def gera_posicao_na_array(tamanho)
  tamanho = tamanho - 1 # Ajusta o limite para evitar ultrapassar o índice máximo
  [
    rand(0..tamanho), # valor da linha (a)
    rand(0..tamanho), # valor da coluna (j)
  ]
end

# Cria uma lista com 7 postes em posições aleatórias
posicao_dos_postes = [
  gera_posicao_na_array(tamanho),
  gera_posicao_na_array(tamanho),
  gera_posicao_na_array(tamanho),
  gera_posicao_na_array(tamanho),
  gera_posicao_na_array(tamanho),
  gera_posicao_na_array(tamanho),
  gera_posicao_na_array(tamanho),
]

# Define a posição inicial do personagem: linha 0 e coluna central
posicao_do_personagem = [0, tamanho/2.floor]

def printa_o_mapa(tamanho, posicao_dos_postes, posicao_do_personagem)
  tamanho.times do | a |#pecorre as linhas

    tamanho.times do | j |#pecorre as colunas

      array_de_match_de_postes = posicao_dos_postes.include?( [a, j] ) #verifica se a posição atual é a do personagem || um poste

      if posicao_do_personagem[0] == a && posicao_do_personagem[1] == j
        print "P " # Imprime o personagem
      elsif array_de_match_de_postes
        print "@ " # imprime um poste
      else
        print ". " # Imprime um espaço vazio
      end
    end

    puts #imprime uma lina nova
  end
end


# verifica se a nova posição colide com algum poste
def colisao_poste(posicao_dos_postes, nova_posicao)
  posicao_dos_postes.any? { | poste | poste == nova_posicao } # true se a nova posição estiver na lista de postes
end

# Loop principal do jogo
loop do
  printa_o_mapa(tamanho, posicao_dos_postes, posicao_do_personagem) # Mostra o mapa

  puts
  puts "Digite W/A/S/D ou Q para sair"
  input_do_user = gets.chomp # entrada do usuário

  # Cria uma cópia da posição atual do personagem
  nova_posicao = [posicao_do_personagem[0], posicao_do_personagem[1]]

  # Atualiza a nova posição com base na tecla pressionada
  if input_do_user == 's'
    nova_posicao[0] += 1 unless nova_posicao[0] == tamanho - 1 # Move para baixo
  elsif input_do_user == 'd'
    nova_posicao[1] += 1 unless nova_posicao[1] == tamanho - 1 # move para direita
  elsif input_do_user == 'w'
    nova_posicao[0] -= 1 unless nova_posicao[0] == 0 # Move para cima
  elsif input_do_user == 'a'
    nova_posicao[1] -= 1 unless nova_posicao[1] == 0 # move para esquerda
  elsif input_do_user == 'q'
    break # Encerra o jogo
  end

  # Verifica se a nova posição colide com um poste
  if colisao_poste(posicao_dos_postes, nova_posicao)
    printa_o_mapa(tamanho, posicao_dos_postes, nova_posicao) # Mostra o mapa final
    puts "Fim de jogo, você acertou um poste!"
    break # Encerra o loop
  else
    posicao_do_personagem = nova_posicao # Atualiza a posição do personagem
  end

  system("clear")
end

puts
puts "Digite enter pra sair"
gets
