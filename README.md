# Principais elementos que constituem um teste Rspec

## describe

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

## context

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

## it

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

## expect

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
