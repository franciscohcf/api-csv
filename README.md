<h1 align="center">Leitura e Exibição de filmes/séries em arquivos CSV v1.0.0</h1>
<p align="center"> Essas API's em conjunto populam o banco de dados por meio de um arquivo CSV e exibem os registros em JSON.</p>

<div align='center' id="tecnologias">
  <img src="https://img.shields.io/static/v1?label=Framework&message=Ruby-on-rails&color=7159c1&style=for-the-badge&logo=Ruby"/>
  <img src="https://img.shields.io/static/v1?label=Database&message=Postgresql&color=7159c1&style=for-the-badge&logo=PostgreSQL"/>
</div>

--------------

<h2 id="project-setup">Setup do projeto</h2>

**Database configuration**

Instale as gems necessárias:

```bash
$ bundle install
```

Rodando o setup:
```bash
$ bin/setup
```

Agora, agora rodando o projto:
```bash
$ rails s
```

--------------

<h2 id="api" align="left">API's</h2>

<h2 id="api" align="left">POST/ Enviando o CSV</h2>

Endpoint para receber arquivo CSV e popular o banco.

```
{{server_url}}/api/v1/seed_movies
```

Padrão de envio:

Type | Key  | Value
-------------- |------| -------------
form-data | File | file.csv

O arquivo CSV deve conter rows com os nomes a seguir:

```
'title' = Nome do Título, 'type' = TV Show ou Movie, 'release_year' = Ano de lançamento , 'country' = País, 'published_at' = Data que entrou no catálogo, 'description' = Descrição do Título
```

<h2 id="api" align="left">GET/ Exibindo os filmes do banco.</h2>

Endpoint para receber arquivo CSV e popular o banco.

```
{{server_url}}/api/v1/movies
```

**NOTA:** Essa API foi construída de forma a aceitar filtros para exibição seletiva.  Para solicitar uma resposta com especificidades utilize querys seguindo os exemplos:

Example Query | Result
-------------- | -------
`/api/v1/movies?country[]=nome_país` |  Devolve os filmes/séries originados do país especificado, sempre utilizar maíusculas da forma correta e o nome em inglês.
`/api/v1/movies?year[]=ano` | Devolve os filmes/séries lançados no ano especificado.
`/api/v1/movies?genre[]=Movie` OU `/api/v1/movies?genre[]=TV Show` | Devolve filmes ou séries.

**NOTA 2:** É possível utilizar mais de um filtro por requisição, apenas é necessário separar os parâmetros por & exemplo:

```
{{server_url}}/api/v1/movies?country[]=United%20States&year[]=2020&genre[]=TV%20Show
```

Exemplo de resposta:

```
[
    {
        id: "bed13139-98d4-4c5b-8d3d-fc074129ed4a",
        title: "13 Reasons Why",
        genre: "TV Show",
        year: "2020",
        country: "United States",
        published_at: "2020-06-05",
        description: "After a teenage girl's perplexing suicide, a classmate receives a series of tapes that unravel the mystery of her tragic choice."
    }
]
```


--------------

<h2 id="testes">Testes</h2>

```bash
$  rspec
```
