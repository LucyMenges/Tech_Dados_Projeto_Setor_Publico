# PROJETO 2 - RESIDÊNCIA TECH AD 
# PROJETO ANÁLISE DE DADOS SETOR PÚBLICO.

--conectando ao banco de dados
USE DATABASE residenciatechad;


# ALTERAÇÃO DAS COLUNAS NECESSÁRIAS NAS TABELAS

--Verificando o tipo de colunas no arquivo aditivos
describe residenciatechad.dados_abertos_aditivos;

--Alterando o tipo da coluna data_inicio_vigencia e data_fim_vigencia para date
ALTER TABLE residenciatechad.dados_abertos_aditivos 
CHANGE COLUMN `data_fim_vigencia` `data_fim_vigencia` DATE NULL DEFAULT NULL,
CHANGE COLUMN 'data_inicio_vigencia' 'data_inicio_vigencia' DATE NULL DEFAULT NULL;


SELECT * FROM residenciatechad.dados_abertos_aditivos;

ALTER TABLE `residenciatechad`.`dados_abertos_contratos` 
CHANGE COLUMN `datainiciovigencia` `datainiciovigencia` DATE NULL DEFAULT NULL ,
CHANGE COLUMN `datafimvigencia` `datafimvigencia` DATE NULL DEFAULT NULL ;

--Verificando o tipo de colunas no arquivo contrato:
DESCRIBE residenciatechad.dados_abertos_contratos;

--Alterando o tipo das colunas datainiciovigencia e datafimvigencia
ALTER TABLE residenciatechad.dados_abertos_contratos 
CHANGE COLUMN `datainiciovigencia` `datainiciovigencia` DATE NULL DEFAULT NULL ,
CHANGE COLUMN `datafimvigencia` `datafimvigencia` DATE NULL DEFAULT NULL ;


#ALTERAÇÃO DO NOME DAS TABELAS PARA recife_dados_despesas_2021 e recife_dados_receitas_2021
--Foi alterado para padronizar e facilitar a manipulação das informações.
ALTER TABLE `residenciatechad`.`recife-dados-despesas-2021` 
RENAME TO  `residenciatechad`.`recife_dados_despesas_2021`;

ALTER TABLE `residenciatechad`.`recife-dados-receitas-2021` 
RENAME TO  `residenciatechad`.`recife_dados_receitas_2021`;

--Verificando o tipo de colunas no arquivo recife-dados-despesas-2021:
DESCRIBE residenciatechad.recife_dados_despesas_2021;



SELECT TOP(10) * FROM residenciatechad.recife_dados_despesas_2021;

SELECT COUNT (*) FROM residenciatechad.recife_dados_despesas_2021;

--Verificando o tipo de colunas no arquivo recife-dados-receitas-2021:
DESCRIBE residenciatechad.recife_dados_receitas_2021;