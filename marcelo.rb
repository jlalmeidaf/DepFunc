#coding : utf-8

$LOAD_PATH.unshift File.expand_path('../../', __FILE__)

['dicionario', 'scriptparser', 'verificadorderegra'].each do |classe|
  require "dep_conceitualv5aafe/#{classe}"
end

dic = DependenciaConceitual::Dicionario.new

# dic.nova_palavra('carlos', 'caixa', 'lanche','cachorro', :pp)
# dic.nova_palavra('alto','magro',:pa)
# dic.nova_palavra('momento',:momento)
# dic.nova_palavra('possui', :possui)
# dic.nova_palavra('entra', 'chega', 'escolhe', 'pede', 'fala',
#                   'paga', 'espera', 'come' ,'sai', 'monta', :act)
# dic.nova_palavra('lanchonete', 'balcao', 'pronto', :loc)

dic.nova_palavra('john', :pp)
dic.nova_palavra('ran', :act)
dic.nova_palavra('tall', :pa)

script = "John a Ran \n John is tall"

#"entra na lanchonete
#          Carlos chega no balcao
#          Carlos escolhe lanche
#          Carlos pede e paga o lanche para o caixa
#          Carlos espera o lanche ficar pronto
#          caixa monta o lanche e entrega à Carlos
#          Carlos come o lanche
#          Carlos sai da lanchonete"

p DependenciaConceitual::ScriptParser.parse(dic, script)

p 'Lanchonete'
p ''
p '1 - Escolher lanche'
p '2 - Sair'

opcao = gets
opcao.delete!("\n")

if(opcao == '1')
  p 'Fale-me das suas opções'
  p ''
  p 'Você prefere:'
  p '1 - Comer vegetais'
  p '2 - Comer carne'
  p '3 - Os dois'

  comida = gets
  comida.delete!("\n")
  p comida

  p ''
  p 'Você tem gastrite?'
  p '1 - Sim'
  p '2 - Não'

  gastrite = gets
  gastrite.delete!("\n")

  if(comida == '1')
    if(gastrite == '1')
      p "Comida sugerida é : Alface"
    end
    if(gastrite == '2')
      puts 'Comida sugerida é : Sanduíche Natural'
    end
  end

  if(comida == '2')
    if(gastrite == '1')
      puts 'Comida sugerida : Hamburguer de Peito de Frango'
    end
    if(gastrite == '2')
      puts 'Comida sugerida : Hamburguer de Picanha'
    end
  end

  if(comida == '3')
    if(gastrite == '1')
      puts 'Comida sugerida : Petisco de peixe'
    end
    if(gastrite == '2')
      puts 'Comida sugerida : Hamburguer com Fritas'
    end
  end
end

