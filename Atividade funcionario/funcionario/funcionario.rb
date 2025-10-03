class Funcionario
  attr_accessor :id, :name, :minimum_salary
  def initialize(id, name, minimum_salary)
    @id = id
    @name = name
    @minimum_salary = minimum_salary
  end

  def total_salary
    @minimum_salary
  end
end





#3- Criação de um CRUD com opções no main.rb:
#   *def Cadastrar funcionario > perguntar o cargo > id | nome | salario
#   **def Listar todos os funcionários
#   ***def Buscar funcionário por nome
#   ****def Atualizar informações
#   *****def Remover funcionário
#   ******def Calcular salários(salário final dos funcionários de acordo com a regra da classe)
#   ***Sair

#4- Classes devem estar em arquivos separados:
#   (funcionario.rb | gerente.rb | vendedor.rb | estagiario.rb)
#   main.rb deve usar o require_relative.