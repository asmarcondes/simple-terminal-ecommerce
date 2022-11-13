module UI
    def UI.clear
        puts "\e[H\e[2J"
    end
end

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

def solicita_input_usuario(converte_inteiro=true)
   input = gets.chomp
   converte_inteiro ? input.to_i : input
end

def exibe_menu_principal
    UI.clear

    puts "Selecione a opção desejada:\n"
    puts "[1] Comprar"
    puts "[2] Sair"

    print "> "

    solicita_input_usuario  
end

def calcula_sub_total(produtos, opcao, quantidade)
    indice_produto = opcao - 1
    preco_produto = produtos[indice_produto]["preco"]

    preco_produto * quantidade     
end

def selecao_produto(produtos)
    UI.clear

    puts "Selecione o Produto Desejado"

    produtos.each_with_index do |produto, i|
        numero = i + 1
        nome = produto["nome"]
        preco = produto["preco"].to_s + "0"

        puts "[#{numero}] #{nome}: #{preco}"            
    end

    solicita_input_usuario 
end

def insere_quantidade
    UI.clear

    print "Digite a quantidade desejada: "

    solicita_input_usuario         
end 

def exibe_produto_escolhido(produto, quantidade)
    UI.clear

    puts "Produto: #{produto["nome"]} - R$#{produto["preco"]}0"
    puts "Quantidade: #{quantidade}"     
end

opcao_menu = exibe_menu_principal
 
while opcao_menu != 2    
    if opcao_menu == 1       
        produto_escolhido = selecao_produto(produtos)
        quantidade = insere_quantidade        
        exibe_produto_escolhido(produtos[produto_escolhido-1] ,quantidade)
        sub_total += calcula_sub_total(produtos, produto_escolhido, quantidade)
        
        puts "Sub-total: R$#{sub_total}0"
        print "Digite 0 para voltar ao menu inicial: "

        opcao_checkout =  solicita_input_usuario   
        opcao_menu = exibe_menu_principal if opcao_checkout == 0
    end   
end

UI.clear
puts "Ate Breve!!!!\n"