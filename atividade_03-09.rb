class Livro
  # Define os atributos que podem ser lidos
  attr_reader :titulo, :autor, :ano, :status

  # Inicializa um novo livro com título, autor, ano e status "Disponível"
  def initialize(titulo, autor, ano)
    @titulo = titulo
    @autor = autor
    @ano = ano
    @status = "Disponível"
  end

  #Emprestar o livro, alterando o status se estiver disponível
  def emprestar
    if @status == "Disponível"
      @status = "Emprestado"
      "Livro foi emprestado!"
    else
      "O livro já está emprestado."
    end
  end

  #Devolve o livro, alterando o status se estiver emprestado
  def devolver
    if @status == "Emprestado"
      @status = "Disponível"
      "Livro devolvido."
    else
      "Livro já está disponível"
    end
  end

  #Verifica se o livro está disponível
  def disponivel
    @status == "Disponível"
  end

  # Retorna os dados do livro
  def exibir_dados
    "#{@titulo}, #{@autor}, #{@ano} - #{@status}"
  end
end


class Biblioteca
  # Permite leitura da lista de livros
  attr_reader :livros

  #Inicializa a biblioteca com uma lista vazia
  def initialize
    @livros = []
  end

  # Adiciona um livro à lista
  def adicionar_livro(livro)
    @livros << livro
  end

  #Exibe os livros que estão disponíveis
  def livros_disponiveis
    disponiveis = @livros.select { |livro| livro.disponivel }
    if disponiveis.empty?
      puts "Nenhum livro disponível, retorne mais tarde."
    else
      disponiveis.each { |livro| puts livro.exibir_dados }
    end
  end

  # Busca livros por título/autor que contenham a informação fornecida
  def buscar_livros(informacao)
    resultados = @livros.select do |livro|
      livro.titulo.include?(informacao) || livro.autor.include?(informacao)
    end
    if resultados.empty?
      puts "Nenhum livro com essa informação."
    else
      puts "Resultados:"
      resultados.each { |livro| puts livro.exibir_dados }
      # Para cada livro encontrado, exibe os dados.
    end
  end

  #Emprestar um livro pelo título
  def emprestar_livro(titulo)
    livro = encontrar_livro(titulo) #Busca um livro pelo título usando o método encontrar_livro
    puts livro ? livro.emprestar : "Livro não encontrado."
    #Se o livro foi encontrado, chama o método emprestar e imprime o resultado
    #Se não foi encontrado (nil?), imprime "Livro não encontrado."
  end

  # Devolver um livro pelo título
  def devolver_livro(titulo)
    livro = encontrar_livro(titulo) #Busca o livro pelo título
    puts livro ? livro.devolver : "Livro não encontrado."
    #Se o livro foi encontrado, chama o método devolver
    #Caso contrário, imprime mensagem de erro
  end

  # Encontra um livro pelo título
  def encontrar_livro(titulo)
    @livros.find { |livro| livro.titulo == titulo }
    #Percorre a lista de livros e retorna o primeiro cujo título seja exatamente igual ao informado
  end

  def excluir_livro(titulo)
  livro = encontrar_livro(titulo)#Busca o livro pelo título
  if livro
    @livros.delete(livro)# Remove o livro da lista
    puts "Livro '#{titulo}' foi excluído da biblioteca."
  else
    puts "Livro não encontrado."
  end
end


end


class Interface
  # interface com uma nova biblioteca
  def initialize
    @biblioteca = Biblioteca.new
  end

  #loop principal do sistema
  def iniciar
    loop do
      menu_usuario
      opcao = gets.chomp.to_i
      opcao_usuario(opcao)
      break if opcao == 7
      puts "\nPressione ENTER para continuar..."
      gets
    end
  end

  # menu de opções para o usuário
  def menu_usuario
    puts "\nMENU DA BIBLIOTECA"
    puts "1. Cadastrar livro"
    puts "2. Listar livros disponíveis"
    puts "3. Buscar livro"
    puts "4. Emprestar livro"
    puts "5. Devolver livro"
    puts "6. Excluir livro"
    puts "7 . Sair"
    puts "Escolha uma opção: "
  end

  # Ação correspondente à opção escolhida
  def opcao_usuario(opcao)
    case opcao
    when 1
      puts "Título do livro: "
      titulo = gets.chomp
      puts "Autor do livro: "
      autor = gets.chomp
      puts "Ano do livro: "
      ano = gets.chomp.to_i
      livro = Livro.new(titulo, autor, ano)
      @biblioteca.adicionar_livro(livro)
      puts "Livro adicionado."
    when 2
      @biblioteca.livros_disponiveis
    when 3
      puts "Digite o título ou autor: "
      informacao = gets.chomp
      @biblioteca.buscar_livros(informacao)
    when 4
      puts "Qual título vai ser emprestado: "
      titulo = gets.chomp
      @biblioteca.emprestar_livro(titulo)
    when 5
      puts "Qual título vai ser devolvido: "
      titulo = gets.chomp
      @biblioteca.devolver_livro(titulo)
    when 6
      puts "Qual titulo vai ser excluido? "
      titulo = gets.chomp
      @biblioteca.excluir_livro(titulo)
    when 7
      puts "Saindo do sistema..."
    else
      puts "Opção inválida, digite novamente."
    end
  end
end

# Inicia o programa
Interface.new.iniciar