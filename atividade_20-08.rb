#Inicializa a biblioteca como um array vazio
biblioteca = []

#Função que exibe o menu com as opções
def listar_opcoes_do_menu
  puts "\n MENU DA BIBLIOTECA"
  puts "1. Cadastrar livro"
  puts "2. Listar livros disponíveis"
  puts "3. Buscar livro"
  puts "4. Emprestar livro"
  puts "5. Devolver livro"
  puts "6. Sair"
  print "Escolha uma opção: "
end

#Função que cadastra um novo livro na biblioteca
def cadastrar_livro(biblioteca)
  # Solicita os dados do livro ao usuário
  print "Título do livro: "
  titulo = gets.chomp
  print "Autor do livro: "
  autor = gets.chomp
  print "Ano de publicação: "
  ano = gets.chomp.to_i
  
  #Cria um hash com os dados do livro e define o status como 'disponível'
  livro = {
    titulo: titulo,
    autor: autor,
    ano: ano,
    status: "disponível",
  }
  #Adiciona o livro ao array da biblioteca
  biblioteca << livro
  puts "Livro cadastrado com sucesso!"
end

#Função que lista todos os livros disponíveis para empréstimo
def listar_livros(biblioteca)
  # Filtra os livros com status 'disponível'
  disponiveis = biblioteca.select { | livro | livro[:status] == "disponível" }

  #Verifica se há livros disponíveis
  if disponiveis.empty?
    puts " Nenhum livro disponível no momento."
  else
    puts "\n LIVROS DISPONÍVEIS:"
    # Exibe os livros disponíveis com título, autor e ano
    disponiveis.each do |livro|
      puts "- #{livro[:titulo]} | #{livro[:autor]} (#{livro[:ano]})"
    end
  end
end

# Função que permite buscar livros pelo título ou autor
def buscar_livro(biblioteca)
  # Solicita um termo de busca ao usuário
  print "Digite parte do título ou autor: "
  termo = gets.chomp

  #Filtra os livros que contenham o termo no título ou autor
  resultados = biblioteca.select do |livro|
    livro[:titulo].include?(termo) || livro[:autor].include?(termo)
  end

  # Exibe os resultados da busca ou informa que nenhum foi encontrado
  if resultados.empty?
    puts "Nenhum livro encontrado com esse termo."
  else
    puts "\n RESULTADOS DA BUSCA:"
    resultados.each do |livro|
      puts "- #{livro[:titulo]} | #{livro[:autor]} (#{livro[:ano]}) - #{livro[:status]}"
    end
  end
end

#Função que permite emprestar um livro
def emprestar_livro(biblioteca)
  # Solicita o título do livro ao usuário
  print "Digite o título do livro que deseja emprestar: "
  titulo = gets.chomp

  # Busca o livro pelo título
  livro = biblioteca.find { |l| l[:titulo] == titulo }

  #Verifica se o livro existe e se está disponível
  if livro.nil?
    puts "Livro não encontrado."
  elsif livro[:status] == "emprestado"
    puts "Esse livro já está emprestado."
  else
    # Atualiza o status do livro para 'emprestado'
    livro[:status] = "emprestado"
    puts "Livro emprestado com sucesso!"
  end
end

# Função que permite devolver um livro emprestado
def devolver_livro(biblioteca)
  # Solicita o título do livro ao usuário
  print "Digite o título do livro que deseja devolver: "
  titulo = gets.chomp

  # Busca o livro pelo título
  livro = biblioteca.find { |l| l[:titulo] == titulo }

  # Verifica se o livro existe e se está emprestado
  if livro.nil?
    puts "Livro não encontrado."
  elsif livro[:status] == "disponível"
    puts "Esse livro já está disponível."
  else
    #Atualiza o status do livro para 'disponível'
    livro[:status] = "disponível"
    puts "Livro devolvido com sucesso!"
  end
end

# Loop principal que mantém o programa em execução até o usuário escolher sair
loop do
  # Exibe o menu de opções
  listar_opcoes_do_menu
  # Lê a opção escolhida pelo usuário
  opcao = gets.chomp.to_i

  # Executa a função de acordo com a opção escolhida
  case opcao
  when 1 then cadastrar_livro(biblioteca)
  when 2 then listar_livros(biblioteca)
  when 3 then buscar_livro(biblioteca)
  when 4 then emprestar_livro(biblioteca)
  when 5 then devolver_livro(biblioteca)
  when 6
    # Encerra o programa
    puts "Saindo do sistema. Até logo!"
    break
  else
    puts "Opção inválida. Tente novamente."
  end
  puts "\nPressione ENTER para voltar ao menu..."
  gets
end
