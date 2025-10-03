require_relative "funcionario.rb"
class Gerente < Funcionario
  attr_accessor :bonus_fixed
  def initialize(id, name, minimum_salary, bonus_fixed)
    # Super serve para chamar um metodo com o mesmo nome
    super(id, name, minimum_salary)
    @bonus_fixed = bonus_fixed
  end

  def total_salary
    @minimum_salary + @bonus_fixed
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