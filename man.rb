module Utils
    def Utils.formata_valor_monetario(numero)
        "R$#{numero}0"
    end
end

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
$produtos = [
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

$sub_total = 0.0

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

def calcula_sub_total(opcao, quantidade)
    indice_produto = opcao - 1
    preco_produto = $produtos[indice_produto]["preco"]

    $sub_total += preco_produto * quantidade     

    UI.linha_vazia
    UI.exibe_mensagem("Sub-total: #{Utils.formata_valor_monetario($sub_total)}")
end

def selecao_produto
    UI.clear
    UI.exibe_mensagem("Selecione o produto desejado:")
    UI.linha_vazia   

    $produtos.each_with_index do |produto, i|
        numero = i + 1
        nome = produto["nome"]
        preco = Utils.formata_valor_monetario(produto["preco"])

        UI.exibe_mensagem("[#{numero}] #{nome}: #{preco}")
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
    nome = produto["nome"]
    preco = Utils.formata_valor_monetario(produto["preco"])

    UI.clear
    UI.exibe_mensagem("Produto: #{nome}")
    UI.exibe_mensagem("Preço unitário: #{preco}")
    UI.exibe_mensagem("Quantidade: #{quantidade}")
end

def exibe_retorno_menu
    UI.linha_vazia
    UI.exibe_mensagem("Digite #{Menu::VOLTAR} para voltar ao menu inicial: ", false)
    UI.solicita_input       
end

opcao_menu = exibe_menu_principal
 
while opcao_menu != Menu::SAIR    
    if opcao_menu == Menu::COMPRAR       
        produto_escolhido = selecao_produto
        quantidade = insere_quantidade  
              
        exibe_produto_escolhido($produtos[produto_escolhido-1], quantidade)
        calcula_sub_total(produto_escolhido, quantidade)
       
        opcao_menu = exibe_retorno_menu
    elsif opcao_menu == Menu::VOLTAR
        opcao_menu = exibe_menu_principal
    end   
end

UI.clear
UI.exibe_mensagem("Até breve!!!")
UI.linha_vazia
