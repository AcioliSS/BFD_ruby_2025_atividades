puts "Digite o tamanho da matriz (número inteiro positivo):"
number = gets.to_i # tamanho total da matriz.
system("clear")

# Cria uma matriz quadrada de tamanho number x number.

matriz = Array.new(number) { Array.new(number, 0) } # Cada célula começa com o valor

# Calcula quantas camadas a matriz terá.
camadas = (number / 2.0).ceil#.ceil arredonda para cima.

#Inicia um loop para preencher cada camada.
camadas.times do | valor |#representa o índice da camada atual
  inicio = valor # onde começa cada camada
  fim = number - valor - 1 # onde termina cada camada

  (inicio..fim).each do | a | # percorre as linhas dentro dessa camada
    (inicio..fim).each do | j |# percorre as colunas dentro dessa mesma camada
      matriz[ a ][ j ] = valor + 1 #atribui o número da camada à posição
    end
  end
end
# Imprime a matriz formatada
puts "\nMatriz #{number} x #{number}: \n\n"
matriz.each do | linha | #percorre cada linha da matriz
  linha.each do | num | # percorre cada número/elemento dentro da linha/array
    print "#{num} ".rjust(3) # imprime o número com espaçamento
  end
  puts
end
puts "\nPressione Enter para sair"
gets


# puts "Digite o tamanho da sua matriz quadratica"
# tamanho = gets.to_i
# system("clear")


# tamanho.times do | a |# Aqui está printando as linhas
  
#   tamanho.times do | j |# Aqui está pritando as colunas
#     print "0 "
#   end

#   puts
# end

# puts
# puts "Digite enter pra sair"
# gets