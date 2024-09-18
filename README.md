# Projeto de Processamento de Arquivos XML
### Descrição
Este projeto foi desenvolvido para processar arquivos XML (NF-e), validar seu conteúdo e extrair dados específicos para visualizaação em relatório. 

### Funcionalidades
- Upload de arquivos XML.
- Validação de arquivos XML utilizando XSD.
- Processamento assíncrono com Sidekiq.
- Extração de dados de destinatários e remetentes a partir de tags XML.
- Geração de logs personalizados para monitoramento do processamento.
- Interface para visualizar os status dos arquivos processados.

### Tecnologias
- Ruby on Rails 6
- Sidekiq para jobs em background
- Nokogiri para parsing de XML
- FactoryBot para criação de dados de teste
- Rspec para testes automatizados
- SimpleCov para cobertura de testes

### Instalação
Pré-requisitos:
- Ruby 3.3.3
- Rails 6
- Redis (necessário para o Sidekiq)
- MySQL ou SQLite

### Passos
- Clone o repositório e instale as dependências:

```ruby
bundle install
```

- Configure o banco de dados:

```ruby
rails db:create db:migrate
```

- Inicie o Sidekiq:

```ruby
bundle exec sidekiq
```

- Inicie o servidor:

```ruby
rails server
```
### Testes
Para rodar os testes automatizados, execute:

```ruby
bundle exec rspec
```
A cobertura dos testes pode ser gerada com o SimpleCov.

### Logs
Os logs de processamento de arquivos XML são salvos em log/file_processes.log. A configuração de log está no arquivo config/environments/development.rb.

### Em Andamento
- [] Aumento na cobertura de testes
- [] Rollback nas transações dos Services
- [] Refatoração de organização do CSS
- [] Refatoração da validação (antes do job)