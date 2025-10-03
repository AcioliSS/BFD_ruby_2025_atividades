#Condicional
puts "...Calculadora..."
puts "Insira um numero qualquer:\n(Resultados até duas casas decimais 0,00):"
first_number = gets.chomp.to_f

puts "Insira um segundo numero: \n(Resultados até duas casas decimais 0,00):"
second_number = gets.chomp.to_f

if first_number.zero? && second_number.zero?
  puts "Erro: ambos os números são zero. Insira outros valores.."
elsif second_number.zero?
  puts "Erro: divisão por zero não permitida."
else
  addition = first_number + second_number
  subtraction = first_number - second_number
  multiplication = first_number * second_number
  division = first_number / second_number
  puts "\nOs resultados das operações abaixo:"
end
puts "Adição: #{format('%.2f', addition)}"
puts "Subtração: #{format('%.2f', subtraction)}"
puts "Multiplicação: #{format('%.2f', multiplication)}"
puts "Divisão: #{format('%.2f', division)}"

############################

# Função/Metodo/Parametro/Condicional
def somar_num(num_1, num_2)#Operação de Adição
  resultado = num_1 + num_2
  puts "O resultado é #{format('%.2f', resultado)}"
end

def subtrair_num(num_1, num_2)#Operação de Subtrair
  resultado = num_1 - num_2
  puts "O resultado é #{format('%.2f', resultado)}"
end

def multiplicar_num(num_1, num_2)#Operação de multiplicação
  resultado = num_1 * num_2
  puts "O resultado é #{format('%.2f', resultado)}"
end

def dividir_num(num_1, num_2)#Operação de divisão
  if num_2 == 0
    puts "Divisão por 0 não é possivel, refaça a operação"
  else
    resultado = num_1 / num_2
    puts "O resultado é #{format('%.2f', resultado)}"
  end
end

def user_input #Primeiro e Segundo numero inserido pelo usuário
  puts "Digite aqui o primeiro número:"
  num_1 = gets.chomp.to_f
  puts "Digite aqui o segundo número:"
  num_2 = gets.chomp.to_f

  somar_num(num_1, num_2)
  subtrair_num(num_1, num_2)
  multiplicar_num(num_1, num_2)
  dividir_num(num_1, num_2)
end

user_input()

############################




# array = [2, 10, 5, 30, 40,22] # Array pre-definido

# num = array.length #Armazena o valor do array e o seu tamanho atual
# (num - 1).times do #Executa o bloco (num - 1) 4 vezes
#   (0...(num - 1)).each do |i|#Leitura dos index 0 a 5
#       if array [i] > array [i + 1]#Verifica se o elemento[atual] é maior
#                                   #Se for verdadeiro, avançar para a prox linha
#         array [i], array[i + 1] = array[i + 1], array[i] #Faz a troca dos elementos
#       end
#     end
#   end
#   puts array.inspect
  