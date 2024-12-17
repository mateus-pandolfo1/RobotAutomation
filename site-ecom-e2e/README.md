# Projeto de Automação de Testes com Robot Framework Web

Este projeto utiliza o Robot Framework para automação de testes de uma aplicação web. O foco é fornecer uma estrutura clara e fácil de entender, permitindo a adição de novos testes e funcionalidades de forma eficiente.

## Estrutura do Projeto


```
robot_framework_web_test/
│
├── tests/
│   ├── exemple.robot
│
├── resources/
│   ├── Support/
│   │   ├── exemple.robot
│   ├── keywords/
│   │   ├── variables.robot
|   |__ locators/
|   |__ ├── exemple.robot
|__ |__ Variables/
|   |__ ├── exemple.robot
│
├── requirements.txt
└── README.md
```

* -d ./logs: Define o diretório onde os logs e os relatórios serão salvos. Neste caso, será a pasta ./logs.
* -v FileEnv:stg: Define uma variável da pasta (para produção “prd” ou homologação ”stg”).
* -v Environment:prd: Define uma variável do ambiente que irá executar (para produção “prd” ou homologação ”stg”).
* ./tests/login.robot: Especifica o caminho para o arquivo de teste Robot Framework que será executado.
## Pré-requisitos

Antes de começar, você precisa ter o Python instalado em seu sistema. Você pode baixar o Python [aqui](https://www.python.org/downloads/).

### Instalação das Dependências

1. Clone este repositório:
   `
   git clone <URL-do-repositório>
   `

2. Instale as dependências:
   `
   pip3 install -r requirements.txt
   `

## Estrutura do Teste

- **tests/**: Contém arquivos de teste, cada um representando um conjunto de casos de teste.
- **resources/**: Contém palavras-chave personalizadas e variáveis reutilizáveis.
- **requirements.txt**: Lista de dependências do projeto.

## Executando os Testes

Para executar todos os testes, utilize o seguinte comando:

`
robot -d ./logs -v  Environment:stg -v EnvFile:stg ./tests/register.robot
`

Os resultados dos testes serão gerados em arquivos de log e relatórios dentro da pasta do projeto. Você pode abrir `log.html` e `report.html` em um navegador para ver os resultados.

## O que está acontecendo no comando?
* -d ./logs: Define o diretório onde os logs e os relatórios serão salvos. Neste caso, será a pasta ./logs.
* -v EnvFile:stg Define uma variável da pasta (para produção “prd” ou homologação ”stg”).
* -v Environment:prd Define uma variável do ambiente que irá executar (para produção “prd” ou homologação ”stg”).
* ./tests/login.robot: Especifica o caminho para o arquivo de teste Robot Framework que será executado.
## Como Contribuir

Se você deseja contribuir para este projeto, sinta-se à vontade para abrir um pull request ou uma issue. 

1. Fork o repositório.
2. Crie uma nova branch (\`git checkout -b feature/nome-da-feature\`).
3. Faça suas alterações e commit (\`git commit -m 'Adicionando nova feature'\`).
4. Push para a branch (\`git push origin feature/nome-da-feature\`).
5. Abra um Pull Request.

" > README.md
