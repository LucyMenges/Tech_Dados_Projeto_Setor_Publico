# Tech_Dados
Serão desenvolvidos três projetos durante a Residencia Tech de Analise Dados, da Harve:
1. Projeto Olist (individual)
2. Projeto Setor Público (individual)
3. Projeto Revelo (grupo)

# PROJETO 2 - SETOR PÚBLICO 

**Objetivo:**

Analisar os dados públicos do Departamento de Compras da Prefeitura do Município de Recife, capital do estado de Pernambuco.<br/> <br/>
A eficiência no setor público passa diretamente pelo uso inteligente dos dados. Frente a esse contexto, todas as esferas do setor público, 
municipal, estadual e federal, têm investido maciçamente na composição de equipes de analistas e cientistas de dados. 
Tais equipes, têm por objetivo, associar dados e contexto, a fim de indicar as melhores decisões para as ações públicas, em benefício da sociedade. <br/><br/>
**Estrutura no Github:**

Pastas:
  * Banco Dados Completo: código SQL para criação do banco de dados "residenciatechad" e os quatro arquivos dele.
  * Tabelas_Preparadas_para_Power_BI: tabelas fato e dimensões geradas em SQL e salvas como .csv para utilizar no Power BI.

Arquivos:
* Sprint Planing 2.pdf: detalhes dos Backlog´s demandados pelo Product Owner, links dos dados e cronograma de execução.
* Apresentação Analise Setor Público.pdf: Respostas e explicações dos gráficos produzidos para cada demanda proposta.
* Observações e passo a passo.pdf: Passo a passo geral da estrutura, Buggs e conclusões de erros.
* Slides Projeto 2 Setor Publico Recife.pdf: Todas as páginas da visualização gerada no Power BI, salva em pdf.
* Script Projeto Setor Publico.sql: Script SQL final, o que foi gerado no MySQL<br/><br/>

**Observações sobre Projeto:**<br/>

Neste projeto as ferramentas sugeridas foram Python, Pandas, SQL, Power BI. A escolha ficou a critério de cada aluno. Tínhamos quatro semanas até a entrega final e trabalhamos com metodologia ágil, com daily´s diárias com Scrum Master. 
O bando de dados era composto por quatro tabelas com várias colunas, após a visualização e análise inicial, decidi que estes seriam preparados no MySQL Workbench, na estrutura de tabelas fato e dimensões e depois o resultado de cada consulta exportado e salvo como .csv, para ser utilizado diretamente no Power BI, para as visualizações. O objetivo foi deixar as tabelas mais enxutas e limpas, apenas com as informações necessárias para responder às demandas solicitadas.
Logo percebi que não havia a necessidade de fazer desta forma, poderia ter utilizado as tabelas completas apenas selecionando algumas colunas específicas. Ficou como aprendizado!
Como era de se esperar este projeto exigiu mais na parte de transformação e limpeza dos dados, como alteração do tipo da coluna; formato e tratar a questão de acentuação das palavras (o arquivo original foi salvo sem reconhecer a acentuação, ou seja, não bastou mudar o código para utf8).
Respondi a todas as quinze demandas do projeto no tempo estipulado.

**Apresentação:**<br/>

https://user-images.githubusercontent.com/78648122/223741910-eebe5b1c-008e-4d89-a2e9-40cc8d78f071.mp4

<br/>
:speaker:  Ative o som, por favor!
<br/>
Para ver o Overview das três apresentações dos projetos, clique no link: https://youtu.be/MBJQa1rW_VA

Para ver a apresentação completa deste projeto, clique no link: https://youtu.be/ndF4eTGmqUg
