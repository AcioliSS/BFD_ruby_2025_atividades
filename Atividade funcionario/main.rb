require_relative "funcionario/funcionario.rb"
require_relative "funcionario/gerente.rb"
require_relative "funcionario/vendedor.rb"
require_relative "funcionario/estagiario.rb"
class Interface
  def initialize
    @funcionarios = []
    @next_id = 1
  end

  def register_employee
    puts "Digite o Cargo (Gerente / Vendedor / Estagiário)"
    function = gets.chomp.downcase
    puts "Digite o Nome: "
    name = gets.chomp
    puts "Digite o salário base: "
    minimum_salary = gets.chomp.to_f

    case function
    when "Gerente", "gerente"
      puts "Digite o bônus fixo: "
      bonus_fixed = gets.chomp.to_f
      employee = Gerente.new(@next_id, name, minimum_salary, bonus_fixed)
    when "Vendedor", "vendedor"
      puts "Digite a comissão: "
      comission = gets.chomp.to_f
      employee = Vendedor.new(@next_id, name, minimum_salary, comission)
    when "Estagiário", "estagiário", "Estagiario", "estagiario"
      employee = Estagiario.new(@next_id, name, minimum_salary)
    else
      system "clear"
      puts "Cargo inválido, digite novamente.."
    end

    @funcionarios << employee
    @next_id += 1
    system "clear"
    puts "Funcionário #{employee.name} cadastrado com sucesso!"
  end

  def list_employees
    if @funcionarios.empty?
      system "clear"
      puts "Nenhum funcionário cadastrado."
    else
      system "clear"
      puts "\nLista de Funcionários:"
      @funcionarios.each do | f |
        puts "ID: #{f.id} | Nome: #{f.name} | Cargo: #{f.class} | Salário Final: R$ #{f.total_salary}"
      end
    end
  end

  def search_name
    puts "Digite o nome do funcionário:"
    name = gets.chomp.downcase

    employee = @funcionarios.find { |f| f.name.downcase == name }

    system "clear"
    if employee
      puts "\nFuncionário encontrado:"
      puts "ID: #{employee.id} | Nome: #{employee.name} | Cargo: #{employee.class} | Salário Final: R$ #{employee.total_salary}"
    else
      puts "\nFuncionário não encontrado."
    end
  end


  def update_employee
    puts "Digite o nome do funcionário que deseja atualizar:"
    name = gets.chomp.downcase
    employee = @funcionarios.find { |f| f.name.downcase == name }

    if employee
      puts "\nFuncionário encontrado:"
      puts "ID: #{employee.id} | Nome: #{employee.name} | Cargo: #{employee.class} | Salário Base: R$ #{employee.minimum_salary}"

      puts "\nO que você deseja atualizar?"
      puts "1. Nome"
      puts "2. Salário base"

      case employee.class.name
      when "Gerente"
        puts "3. Bônus fixo"
      when "Vendedor"
        puts "3. Comissão"
      end

      puts "Escolha uma opção: "
      option = gets.chomp.to_i
      case option
      when 1
        puts "Novo nome: "
        employee.name = gets.chomp.downcase
      when 2
        puts "Novo salário base: "
        employee.minimum_salary = gets.chomp.to_f
      when 3
        case employee.class.name
        when "Gerente"
          puts "Novo bônus fixo: "
          employee.bonus_fixed = gets.chomp.to_f
        when "Vendedor"
          puts "Nova comissão: "
          employee.comission = gets.chomp.to_f
        else
          puts "Essa opção não se aplica ao cargo #{employee.class}."
        end
      else
        puts "Opção inválida."
      end

      puts "\nFuncionário atualizado com sucesso!"
    else
      puts "\nFuncionário não encontrado."
    end
  end


  def remove_employee
    puts "Digite o nome do funcionário para removê-lo:"
    name = gets.chomp.downcase

    employee = @funcionarios.find { |f| f.name.downcase == name }

    if employee
      @funcionarios.delete(employee)
      puts "O funcionário #{employee.name} foi deletado."

      @funcionarios.each_with_index do | f, index |
      f.id = index + 1
      end

      @next_id = @funcionarios.size + 1
    else
      puts "Funcionário não encontrado."
    end
  end


  def register_menu
      puts "Menu para cadastrar Funcionários: "
      puts "1. Cadastrar funcionário."
      puts "2. Listar todos os funcionários."
      puts "3. Buscar funcionário pelo Nome."
      puts "4. Atualizar informações do funcionário."
      puts "5. Remover funcionário"
      puts "6. Sair"
      puts "Escolha uma opção: "
      gets.chomp.to_i
  end

  def choice
    case register_menu
    when 1 then register_employee()
    when 2 then list_employees()
    when 3 then search_name()
    when 4 then update_employee()
    when 5 then remove_employee()
    when 6 then exit
    end
  end
end


interface = Interface.new

loop do
  interface.choice
  puts "\nPressione ENTER para continuar..."
  gets
end