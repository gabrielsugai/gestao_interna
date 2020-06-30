# README

## API's

## Cadastro de empresas

### Descrição
<p align="justify"> A API de cadastro de empresas tem a funcionalidade de ao receber os dados de uma empresa, cadastra-los no nosso sistema e gerar o token para identificações dessa empresa no futuro. Assim que cadastrado os dados são devolvidos adicionando o token gerado.</p>

### Parametros necessarios
- Model [company]
- Nome da empresa [name]
- Razão social [corporate_name]
- Endereço [address]
- CNPJ [cnpj]
- __Todos os dados devem ser enviados como um JSON__
- __Exemplo:__
  - __{ company: { name: 'TreinaDev', corporate_name: 'CampusCode', address: 'Av. Ṕaulista, 123', cnpj: ' 00.000.000/0000-00' } }__

### Parametros devolvidos
- Nome da empresa [name]
- Razão social [corporate_name]
- Endereço [address]
- CNPJ [cnpj]
- Código gerado para identificação da empresa [token]
- ID [id]
- __Todos os dados serão enviados como um JSON__

### Verbo HTTP
- __POST__
- Os dados devem ser enviados para  seguinte rota:
  - __/api/v1/companies__

### Possiveis erros
- Parametros obrigatorios:
  - Nome, Razão social, Endereço, CNPJ. Caso algum parametro estivem em branco a resposta será:
    - [atributo] não pode ficar em branco
  - Erros exclusivos do CNPJ:
    - __já está em uso__ - Motivo: CNPJ já cadastrado
    - __não é válido__ - Motivo: CNPJ incorreto, ou, fora de formatação
- Company vazio:
  - Mensagem: __param is missing or the value is empty: company__
  - Motivo: __chave company faltando no json { company: { } }__