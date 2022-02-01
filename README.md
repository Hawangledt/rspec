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
