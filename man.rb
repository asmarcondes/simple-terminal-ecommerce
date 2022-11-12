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

def calcula_sub_total(produtos, opcao, quantidade)
    indice_produto = opcao - 1
    preco_produto = produtos[indice_produto]["preco"]

    preco_produto * quantidade     
end

opcao_menu = exibe_menu_principal

while opcao_menu != 2    
    if opcao_menu == 1
        puts "Selecione o Produto Desejado"

        produtos.each_with_index do |produto, i|
            numero = i + 1
            nome = produto["nome"]
            preco = produto["preco"].to_s + "0"

            puts "[#{numero}] #{nome}: #{preco}"            
        end        

        produto_escolhido = gets.chomp.to_i

        print "Digite a quantidade desejada: "

        quantidade = gets.chomp.to_i        

        puts "Produto: #{produtos[produto_escolhido - 1]["nome"]} - R$#{produtos[produto_escolhido - 1]["preco"]}0"
        puts "Quantidade: #{quantidade}"        

        sub_total += calcula_sub_total(produtos, produto_escolhido, quantidade)
        
        puts "Sub-total: R$#{sub_total}0"
        print "Digite 0 para voltar ao menu inicial :"
        opcao_checkout = gets.chomp.to_i        

        opcao_menu = exibe_menu_principal if opcao_checkout == 0
    end   
end

puts "Ate Breve!!!!"