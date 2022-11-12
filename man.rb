produtos = [ 
    {
        "nome" => "Produto A",
        "preco" => 50.0        
    }, 
    {
        "nome" => "Produto B",
        "preco" => 200.0        
    }, 
    {
        "nome" => "Produto C",
        "preco" => 100.0        
    }    
]

sub_total = 0

puts "Selecione a opcao desejada:"
puts "[1] Comprar"
puts "[2] Sair "

opcao_escolhida = gets.chomp.to_i 
    if opcao_escolhida == 1
        puts "Selecione o Produto Desejado"
        puts "[1] Produto A: R$50.00"
        puts "[2] Produto B: R$200.00"
        puts "[3] Produto C: R$100.00"

        produto_escolhido = gets.chomp.to_i

        print "Digite a quantidade desejada: "

        quantidade = gets.chomp.to_i        

        puts "Produto: #{produtos[produto_escolhido - 1]["nome"]} - R$#{produtos[produto_escolhido - 1]["preco"]}"
        puts "Quantidade: #{quantidade}"

        preco = produtos[produto_escolhido - 1]["preco"]
        sub_total += preco * quantidade
        
        puts "Sub-total: R$#{sub_total}0"
    elsif opcao_escolhida == 2
        puts "Ate Breve!!!!"
    end