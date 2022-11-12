# Lista de produtos disponíveis para adicionar ao carrinho
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

# Variáveis de controle do e-commerce
sub_total = 0.0
opcao_menu = 0

def exibe_menu_principal
    puts "Selecione a opção desejada:\n"
    puts "[1] Comprar"
    puts "[2] Sair"

    print "> "

    gets.chomp.to_i 
end

opcao_menu = exibe_menu_principal

while opcao_menu != 2    
    if opcao_menu == 1
        puts "Selecione o Produto Desejado"
        puts "[1] Produto A: R$50.00"
        puts "[2] Produto B: R$200.00"
        puts "[3] Produto C: R$100.00"

        produto_escolhido = gets.chomp.to_i

        print "Digite a quantidade desejada: "

        quantidade = gets.chomp.to_i        

        puts "Produto: #{produtos[produto_escolhido - 1]["nome"]} - R$#{produtos[produto_escolhido - 1]["preco"]}0"
        puts "Quantidade: #{quantidade}"

        preco = produtos[produto_escolhido - 1]["preco"]
        sub_total += preco * quantidade
        
        puts "Sub-total: R$#{sub_total}0"
        print "Digite 0 para voltar ao menu inicial :"
        opcao_checkout = gets.chomp.to_i        

        opcao_menu = exibe_menu_principal if opcao_checkout == 0
    end   
end

puts "Ate Breve!!!!"