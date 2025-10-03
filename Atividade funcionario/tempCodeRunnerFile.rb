    puts "Digite o nome do funcionário:"
    name = gets.chomp.downcase
    @funcionarios.find { |employee| employee.name.downcase == name }
  end