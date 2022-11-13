module UI
    def UI.clear        
        print "\e[H"    # tells the terminal to move the cursor to the top left corner, false
        print "\e[2J"   # clear the screen, false
        print "\e[3J"   # clear the scrollback buffer, false
    end

    def UI.exibe_mensagem(mensagem, quebra_linha=true)
        if quebra_linha
            puts mensagem
        else
            print mensagem
        end
    end

    def UI.solicita_input(converte_inteiro=true)
        input = gets.chomp
        converte_inteiro ? input.to_i : input
    end

    def UI.linha_vazia
        puts ""
    end
end

module Menu
    COMPRAR = 1
    SAIR = 2
    VOLTAR = 0
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

def exibe_menu_principal
    UI.clear
    UI.exibe_mensagem("* MENU PRINCIPAL *")
    UI.exibe_mensagem("Selecione a opção desejada:")     
    UI.linha_vazia

    UI.exibe_mensagem("[#{Menu::COMPRAR}] Comprar")
    UI.exibe_mensagem("[#{Menu::SAIR}] Sair")
    UI.linha_vazia

    UI.exibe_mensagem("> ", false)
    UI.solicita_input  
end

def calcula_sub_total(produtos, opcao, quantidade)
    indice_produto = opcao - 1
    preco_produto = produtos[indice_produto]["preco"]

    preco_produto * quantidade     
end

def selecao_produto(produtos)
    UI.clear
    UI.exibe_mensagem("Selecione o produto desejado:")
    UI.linha_vazia   

    produtos.each_with_index do |produto, i|
        numero = i + 1
        nome = produto["nome"]
        preco = produto["preco"].to_s + "0"

        UI.exibe_mensagem("[#{numero}] #{nome}: #{preco}"            )
    end

    UI.linha_vazia
    UI.exibe_mensagem("> ", false)

    UI.solicita_input 
end

def insere_quantidade
    UI.clear
    UI.exibe_mensagem("Digite a quantidade desejada: ", false)
    UI.solicita_input         
end 

def exibe_produto_escolhido(produto, quantidade)
    UI.clear
    UI.exibe_mensagem("Produto: #{produto["nome"]} - R$#{produto["preco"]}0")
    UI.exibe_mensagem("Quantidade: #{quantidade}")
end

sub_total = 0.0
opcao_menu = exibe_menu_principal
 
while opcao_menu != Menu::SAIR    
    if opcao_menu == Menu::COMPRAR       
        produto_escolhido = selecao_produto(produtos)
        quantidade = insere_quantidade        
        exibe_produto_escolhido(produtos[produto_escolhido-1] ,quantidade)
        sub_total += calcula_sub_total(produtos, produto_escolhido, quantidade)
        
        UI.linha_vazia
        UI.exibe_mensagem("Sub-total: R$#{sub_total}0")

        UI.linha_vazia
        UI.exibe_mensagem("Digite #{Menu::VOLTAR} para voltar ao menu inicial: ", false)

        opcao_checkout =  UI.solicita_input
        opcao_menu = exibe_menu_principal if opcao_checkout == Menu::VOLTAR
    end   
end

UI.clear
UI.exibe_mensagem("Até breve!!!")
UI.linha_vazia
