# cadastro_pessoa = { #Criando hash com dados pré-definidos
#   nome: "Acioli",
#   idade: 25,
#   cidade: "Recife",
# }

# #Exibindo a frase
# puts "Meu nome é #{pessoa[:nome]}, tenho #{pessoa[:idade]} anos e moro em #{pessoa[:cidade]}."


#########################################


# agenda = { #Criando agenda com contatos
#   "Pedro" => "81 99999-1234",
#   "Bruno" => "81 98888-5678",
#   "Carla" => "81 97777-9012"
# }

# #Solicita o nome do contato
# print "Digite o nome do contato que deseja buscar: "
# nome = gets.chomp

# #Verifica se o contato existe
# if agenda[nome]
#   puts "O telefone de #{nome} é #{agenda[nome]}."
# else
#   puts "Contato não encontrado."
# end


#####################################


#Array para armazenar os produtos
carrinho = []

loop do
  puts "\nDigite o nome do produto (ou 'sair' para finalizar):"
  nome = gets.chomp

  break if nome.downcase == "sair"

  puts "Digite o valor do produto:"
  valor = gets.chomp.to_f

  produto = { nome: nome, valor: valor }
  carrinho << produto
end

# Exibindo os produtos cadastrados
puts "\nProdutos cadastrados:"
total = 0.0

#Percorre os produtos e mostrar o indice de cada item na lista.
carrinho.each_with_index do |produto, index| 
  puts "#{index + 1}. #{produto[:nome]} - R$#{'%.2f' % produto[:valor]}" #Transforma o indice(0) numa contagem humana(1)
  total += produto[:valor]
end

# Exibindo o total
puts "\nValor total: R$#{'%.2f' % total}"