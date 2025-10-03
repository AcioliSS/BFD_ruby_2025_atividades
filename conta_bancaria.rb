class ContaBancaria
  attr_reader :account, :name, :saldo
  def initialize(account, name, deposito)
    @account = account
    @name = name
    @saldo = deposito
  end

  def mostrar_saldo
    puts "Saldo atual da conta #{@account} de #{@name}: R$#{@saldo}"
  end

  def transferir(valor, conta_destino)
    if valor <= 0
      puts "Valor inválido para transferência."
      return
    end
    if valor > @saldo
      puts "Saldo insuficiente para transferência."
      return
    end
    @saldo -= valor
    conta_destino.receber_transferencia(valor)
    puts "Transferência de R$#{valor} realizada com sucesso para #{conta_destino.name}."
  end

  def receber_transferencia(valor) #linha 40
    @saldo += valor
  end
end

cc1 = ContaBancaria.new("Banco", "Loucei", 1222.11)
cc2 = ContaBancaria.new("Bank", "Ceilou", 1000.00)

cc1.mostrar_saldo
cc2.mostrar_saldo

#transferir o valor passado no parametro para a conta tabem passada no paramentro
#Não pode transferir um valor maior que o meu saldo
cc1.transferir(300, cc2)

cc1.mostrar_saldo
cc2.mostrar_saldo



# i = 0
# loop do
#   puts "i is #{i}"
#   i += 1
#   break if i == 10
# end


# i = 0
# while i < 10 do
#  puts "i is #{i}"
#  i += 1
# end

# i = 0
# until i >= 10 do
#  puts "i is #{i}"
#  i += 1
# end

# (1..5)      # inclusive range: 1, 2, 3, 4, 5
# (1...5)     # exclusive range: 1, 2, 3, 4

# # We can make ranges of letters, too!
# ('a'..'d')  # a, b, c, d

# for i in 0...5
#   puts "#{i} zombies incoming!"
# end

# 5.times do
#   puts "Hello, world!"
# end

# 5.upto(10) { |num| print "#{num} " }     #=> 5 6 7 8 9 10

# 10.downto(5) { |num| print "#{num} " }   #=> 10 9 8 7 6 5