# RSpec

RSpec é uma ferramenta de teste de linguagem específica de domínio de computador escrita na linguagem de programação Ruby para testar o código Ruby. É uma estrutura de desenvolvimento orientada por comportamento que é amplamente usada em aplicativos de produção.

## Principais elementos que constituem um teste Rspec

### describe

- É usado para definir um "Grupo de Exemplos"
- Pode receber um nome de classe ou uma string como parâmetros
  - Hero
  - '#destroy'

```ruby
describe Hero do
    ...
    ...
end
```

### context

- Agrupa testes associados ao mesmo contexto
- Não é obrigatório mas ajuda a tornar os testes mais legíveis e simples

```ruby
describe Hero do
    context 'quando está com a armadura' do
        ...
        ...
    end
end
```

### it

- É usado para definir um exemplo (teste)

```ruby
describe Hero do
    context 'quando está com a armadura' do
        it 'tem 5000 pontos de hp' do
            ...
            ...
        end
    end
end
```

### expect

- É onde verificamos se uma determinada condição está ocorrendo para concluirmos que nosso teste passou

```ruby
describe Hero do
    context 'quando está com a armadura' do
        it 'tem 5000 pontos de hp' do
            hero = Hero.new
            expect(hero.hp).to eq(5000)
        end
    end
end
```

## O que são os matchers

- Uma instrução para verificar se uma determinada condição está sendo atendida

```ruby
expect(message).to eq 'Hello Hero!'
```

### Matchers importantes

- Matchers de equivalência e identidade

```ruby
# Passa se o valor for == ao esperado
expect(actual).to eq(expect)

# Passa se x.eql?(y)
expect(x).to eql(y)

# Passa de x.equal?(y)
expect(x).to be(y)
```

- Matchers de comparação

```ruby
# Passa se o valor for maior que x
expect(actual).to be > x

# Passa se o valor for maior ou igual a x
expect(actual).to be >= x

# Passa se o valor for menor ou igual a x
expect(actual).to be <= x

# Passa se o valor for menor a x
expect(actual).to be < x

# Passa se o valor bater com a expressão regular
expect(actual).to match(/expression/)
```

- Matchers de classe e tipo

```ruby
# Passa se o objeto for uma instancia da classe esperada
expect(actual).to be_an_instance_of(expect)

# Passa se o tipo do objeto for esperado
expect(actual).to be_a(expect)
```

- Matchers True/False/Nil

```ruby
# Passa enquanto o valor não for false ou nil
expect(actual).to be_truthy

# Passa quando o valor for == true
expect(actual).to be true

# Passa quando o valor for false ou nil
expect(actual).to be_falsy

# Passa quando o valor for == false
expect(actual).to be_nil

# Passa se o valor não for nil
expect(actual).to_not be_nil
```

- Matchers de erro

```ruby
# Passa se a chamada levantar um erro
expect { ... }.to raise_error

# Passa se a chamada levantar um erro do tipo ErrorClass
expect { ... }.to raise_error(ErrorClass)

# Passa se a chamada levantar um erro com a mensagem "message"
expect { ... }.to raise_error("message")

# Passa se a chamada levantar um erro do tipo ErrorClass com a mensagem "message"
expect { ... }.to raise_error(ErrorClass, "message")
```

## spec_helper.rb

- Ele é o arquivo base de configuração do Rspec
- Exemplo de configuração
  - config.order = :random

## rails_helper.rb

- Arquivo que carrega as dependencias do Rails e faz as configurações necessárias para que o Rspec rode em conjunto com ele.
- Exemplo de configuração
  - config.use_transactional_fixtures = true

## Generators no Rspec-Rails

Scripts que geram arquivos de testes com a estrutura básica pronta para que você possa criar seus testes facilmente

- Gerando um model com teste

```terminal
rails generate model user
```

- Gerando um teste de request

```terminal
rails generate rspec:request User
```

- Conhecendo todas as opções

```terminal
rails generate --help | grep rspec
```

## O que são models?

São classes Ruby que se conectam às tabelas no banco de dados para permitir uma fácil manipulação delas.

Testar os models ajuda a garantir que a estrutura de dados esteja correta.

- Quando testar?
  - Em geral quando existem validações customizadas.

## O que é a Gem FFaker?

Uma gem que permite gerar valores aleatórios

- Exemplos:

```ruby
FFaker::Name.name #=> "Green wizard"
FFaker::Internet.email #=> "green@wizard.com"
FFaker::Address.city #=> "Camelot"
```

### Porque ela pode melhorar nossos testes?

Porque ela evita que criemos testes viciados, ou seja, que só funcionam com determinados valores de variávies.

## O que é a Gem Factory Bot?

Uma ferramenta para manipularmos records de forma organizada nos testes.

- Exemplo:

```ruby
FactoryBot.define do
    factory :weapon do
        name { 'excalibur' }
        kind { :sword }
    end
end
```

### Porque ela pode melhorar nossos testes?

- Porque nós conseguimos organizar melhor a gestão dos nossos records e passamos a escrever menos códigos repetidos (DRY).

## O que são teste de request?

São testes de integração (ou seja, que testam vários componentes ao mesmo tempo) que realiza uma request completa para um endpoint do seu projeto e verifica se ele está respondendo adequadamente.

- Exemplo:

```ruby
describe "GET /home" do
    it "has the message 'Hello World'" do
        get home_path
        expect(response.body).to include("Hello World")
    end
end
```

### Porque usar testes de request?

- Para garantir que o seu endpoint está devolvendo o status code e a resposta esperada para ele.
- Para garantir que a integração entre os diversos elementos (model, controller, rota e etc) necessários para a resposta do endpoint estão funcionando adequadamente juntos.

## O que é um helper do Rspec?

Métodos que podem ser reaproveitados ao longo dos testes.

- Exemplo:

```ruby
module Helpers
    module Authentication
        def sign_in_as(user)
            # Códigos para estabelecer o sign_in
        end
    end
end
```
