# PROJETO 2 - RESIDÊNCIA TECH AD 
## PROJETO ANÁLISE DE DADOS SETOR PÚBLICO.

--conectando ao banco de dados
USE residenciatechad;


# ALTERAÇÃO DAS COLUNAS NECESSÁRIAS NAS TABELAS

## TABELA 1 - ADITIVOS

SELECT * FROM residenciatechad.dados_abertos_aditivos;

--Verificando o tipo de colunas na tabela ADITIVOS
describe residenciatechad.dados_abertos_aditivos;

--Alterando o tipo da coluna data_inicio_vigencia e data_fim_vigencia para date
ALTER TABLE residenciatechad.dados_abertos_aditivos 
CHANGE COLUMN `data_fim_vigencia` `data_fim_vigencia` DATE NULL DEFAULT NULL,
CHANGE COLUMN 'data_inicio_vigencia' 'data_inicio_vigencia' DATE NULL DEFAULT NULL;

## TABELA 2 - CONTRATOS

SELECT * FROM residenciatechad.dados_abertos_contratos;

--Verificando o tipo de colunas no arquivo contrato:
DESCRIBE residenciatechad.dados_abertos_contratos;

--Alterando o tipo das colunas datainiciovigencia e datafimvigencia
ALTER TABLE residenciatechad.dados_abertos_contratos 
CHANGE COLUMN `datainiciovigencia` `datainiciovigencia` DATE NULL DEFAULT NULL ,
CHANGE COLUMN `datafimvigencia` `datafimvigencia` DATE NULL DEFAULT NULL ;

## ALTERAÇÕES NAS TABELAS recife_dados_despesas_2021 e recife_dados_receitas_2021:

--Foi alterado o nome para padronizar e facilitar a manipulação das informações.
ALTER TABLE `residenciatechad`.`recife-dados-despesas-2021` 
RENAME TO  `residenciatechad`.`recife_dados_despesas_2021`;

ALTER TABLE `residenciatechad`.`recife-dados-receitas-2021` 
RENAME TO  `residenciatechad`.`recife_dados_receitas_2021`;

## TABELA 3 - DESPESAS 

--Verificando quais mudanças seráo necessárias TABELA DESPESAS:
SELECT * FROM residenciatechad.recife_dados_despesas_2021 LIMIT 20;

--Alterando a formatação dos números nas colunas 'valor_empenhado', 'valor_liquidado' e 'valor_pago',
--Após isso será alterado o tipo de TEXT para DOUBLER.
UPDATE residenciatechad.recife_dados_despesas_2021 SET 
    valor_empenhado = REPLACE (valor_empenhado,',','.'),
    valor_liquidado = REPLACE (valor_liquidado, ',', '.'),
    valor_pago = REPLACE (valor_pago, ',', '.');

--Verificando o tipo de colunas no arquivo recife-dados-despesas-2021:
DESCRIBE residenciatechad.recife_dados_despesas_2021;

--Verificar a quantidade máxima de caracteres das colunas de valores.
SELECT MAX(length(valor_empenhado)),    --12
MAX(length(valor_liquidado)),           --11
MAX(length(valor_pago))                 --11
from residenciatechad.recife_dados_despesas_2021;

--Alterando o tipo das colunas de TEXT para DECIMAL(13,2)
ALTER TABLE residenciatechad.recife_dados_despesas_2021
CHANGE COLUMN `valor_empenhado` `valor_empenhado` DECIMAL(13,2) NULL DEFAULT NULL,
CHANGE COLUMN `valor_liquidado` `valor_liquidado` DECIMAL(13,2) NULL DEFAULT NULL,
CHANGE COLUMN `valor_pago` `valor_pago` DECIMAL(13,2) NULL DEFAULT NULL;

--Verificar a quantidade máxima de caracteres das colunas de valores.
SELECT MAX(length(orgao_codigo)),           --2
MAX(length(fonte_recurso_codigo)),          --4
MAX(length(grupo_despesa_codigo)),          --1
MAX(length(credor_codigo)),                 --7
MAX(length(modalidade_licitacao_codigo))    --2
FROM residenciatechad.recife_dados_despesas_2021;

select max(length(categoria_economica_codigo))
from residenciatechad.recife_dados_despesas_2021; --1

--Alterando o tipo de algumas colunas de BIGINT(20) para INT
ALTER TABLE residenciatechad.recife_dados_despesas_2021
CHANGE COLUMN `ano_movimentacao` `ano_movimentacao` YEAR(4) NULL DEFAULT NULL,
CHANGE COLUMN `mes_movimentacao` `mes_movimentacao` SMALLINT (2) NULL DEFAULT NULL,
CHANGE COLUMN `orgao_codigo` `orgao_codigo` SMALLINT (3) NULL DEFAULT NULL,
CHANGE COLUMN `fonte_recurso_codigo` `fonte_recurso_codigo` SMALLINT (4) NULL DEFAULT NULL,
CHANGE COLUMN `grupo_despesa_codigo` `grupo_despesa_codigo` SMALLINT (2) NULL DEFAULT NULL,
CHANGE COLUMN `modalidade_licitacao_codigo` `modalidade_licitacao_codigo` SMALLINT(2) NULL DEFAULT NULL;

ALTER TABLE residenciatechad.recife_dados_despesas_2021
CHANGE COLUMN `categoria_economica_codigo` `categoria_economica_codigo` SMALLINT(1) DEFAULT NULL,
CHANGE COLUMN `empenho_ano` `empenho_ano` YEAR(4) DEFAULT NULL,
CHANGE COLUMN `empenho_modalidade_codigo` `empenho_modalidade_codigo` SMALLINT(4);

## TABELA 4 - RECEITAS

--Verificando quais mudanças seráo necessárias TABELA RECEITAS:
SELECT * FROM residenciatechad.recife_dados_receitas_2021 LIMIT 20;

--Alterando a formatação dos números nas colunas 'receita_prevista', 'receita_prevista_acrescimo', 'receita_prevista_atualizada' e 'receita_arrecadada'.
--Após isso será alterado o tipo de TEXT para DOUBLER.
UPDATE residenciatechad.recife_dados_receitas_2021 SET 
    receita_prevista = REPLACE (receita_prevista, ',', '.'),
    receita_prevista_acrescimo = REPLACE (receita_prevista_acrescimo, ',', '.'),
    receita_prevista_atualizada = REPLACE (receita_prevista_atualizada, ',', '.'),
    receita_arrecadada = REPLACE (receita_arrecadada, ',', '.');

--Verificando o tipo de colunas no arquivo recife-dados-receitas-2021:
DESCRIBE residenciatechad.recife_dados_receitas_2021;

--Verificar a quantidade máxima de caracteres das colunas de valores.
SELECT MAX(length(receita_prevista)),       --10
MAX(length(receita_prevista_acrescimo)),    --11    
MAX(length(receita_prevista_atualizada)),   --11
MAX(length(receita_arrecadada))             --12
from residenciatechad.recife_dados_receitas_2021;

--Alterando o tipo de algumas colunas de TEXT para DECIMAL(15,2)
ALTER TABLE residenciatechad.recife_dados_receitas_2021
CHANGE COLUMN `receita_prevista` `receita_prevista` DECIMAL(15,2) NULL DEFAULT NULL,
CHANGE COLUMN `receita_prevista_acrescimo` `receita_prevista_acrescimo` DECIMAL(15,2) NULL DEFAULT NULL,
CHANGE COLUMN `receita_prevista_atualizada` `receita_prevista_atualizada` DECIMAL(15,2) NULL DEFAULT NULL,
CHANGE COLUMN `receita_arrecadada` `receita_arrecadada` DECIMAL(15,2) NULL DEFAULT NULL;

--Verificar a quantidade máxima de caracteres das colunas de valores.
SELECT MAX(length(orgao_codigo)),           --2
MAX(length(fonte_recurso_codigo)),          --3
MAX(length(categoria_receita_codigo)),      --1
MAX(length(receita_local_codigo))           --4
from residenciatechad.recife_dados_receitas_2021;

--Alterando o tipo de algumas colunas de BIGINT(20) para INT
ALTER TABLE residenciatechad.recife_dados_receitas_2021
CHANGE COLUMN `ano` `ano` YEAR(4) NULL DEFAULT NULL,
CHANGE COLUMN `mes` `mes` SMALLINT (2) NULL DEFAULT NULL,
CHANGE COLUMN `orgao_codigo` `orgao_codigo` SMALLINT (3) NULL DEFAULT NULL,
CHANGE COLUMN `fonte_recurso_codigo` `fonte_recurso_codigo` SMALLINT (4) NULL DEFAULT NULL;

ALTER TABLE residenciatechad.recife_dados_receitas_2021
CHANGE COLUMN `categoria_receita_codigo` `categoria_receita_codigo` SMALLINT (2) NULL DEFAULT NULL,
CHANGE COLUMN `receita_local_codigo` `receita_local_codigo` SMALLINT (5) NULL DEFAULT NULL;

# SELEÇÃO DAS TABELAS PARA EXPORTAÇÃO PARA O POWER BI 

## TABELA 3 - DESPESAS 

--Tabela Principal - Fato:
SELECT 
	ano_movimentacao,
    mes_movimentacao,
    orgao_codigo,
    fonte_recurso_codigo,
    categoria_economica_codigo,
    grupo_despesa_codigo,
    credor_codigo,
    modalidade_licitacao_codigo,
    empenho_ano,
    empenho_modalidade_codigo,
    valor_empenhado,
    valor_liquidado,
    valor_pago    
FROM residenciatechad.recife_dados_despesas_2021;

--Tabelas Secundárias - Dimensão:






## TABELA 4 - RECEITAS

--Tabela Principal - Fato:
SELECT ano,
	mes,
    orgao_codigo,
	fonte_recurso_codigo,
    categoria_receita_codigo,
    receita_local_codigo,
    receita_prevista,
    receita_prevista_acrescimo,
    receita_prevista_atualizada,
	receita_arrecadada    
FROM residenciatechad.recife_dados_receitas_2021;

--Tabelas Secundárias - Dimensão:

--Tabela com os códigos e nomes dos órgãos:
SELECT DISTINCT (orgao_codigo),
	orgao_nome
FROM residenciatechad.recife_dados_receitas_2021;

--Tabela com os códigos e nomes das fontes de recursos:
SELECT DISTINCT (fonte_recurso_codigo),
	fonte_recurso_nome
FROM residenciatechad.recife_dados_receitas_2021;

--Tabela com os códigos e nomes das categorias de receitas:
SELECT DISTINCT (categoria_receita_codigo),
	categoria_receita_nome
FROM residenciatechad.recife_dados_receitas_2021;

--Tabela com os códigos e nomes da receita local (origem):
SELECT DISTINCT (receita_local_codigo),
	receita_local_nome
FROM residenciatechad.recife_dados_receitas_2021;


