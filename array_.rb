# Implementar um laço num array desordenado [2,10,5,30,40].do
criar um array[]
[2,10,5,30,40].do
  algoritmo de ordenação
end
# output tem que ser = array [2,5,10,30,40]

array = [2, 5, 10, 40, 30] # Array pré-definido

num = array.length # Armazena o array e seu tamanho atual

(num - 1).times do #Executa o bloco (num - 1) 4 vezes(index 0 at 4)
  (0...(num - 1)).each do |i| #Pecorre todos os index
    if array[i] > array[i + 1] #Verifica se o elemento[atual] é maior que o proximo
                               #Se verdadeiro, ir para a linha 16:
      array[i], array[i + 1] = array [i + 1], array[i] #Troca os dois elementos de lugar
    end
  end
end

puts "Numero de itens na lista: #{num}\nO array ordenado: #{array}"