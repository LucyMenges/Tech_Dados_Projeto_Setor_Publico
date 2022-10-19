# PROJETO 2 - RESIDÊNCIA TECH AD 
# PROJETO ANÁLISE DE DADOS SETOR PÚBLICO.

--conectando ao banco de dados
USE residenciatechad;

--Verificando o tipo de colunas no arquivo aditivos
describe dados_abertos_aditivos;

--Alterando o tipo da coluna data_inicio_vigencia e data_fim_vigencia para date

ALTER TABLE dados_abertos_aditivos
ADD PRIMARY KEY(num_contrato);



