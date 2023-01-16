CREATE TABLE
  gold.tb_analise_un_negocio
AS (
SELECT
tb_vendas_gb.COD_UN_NEGOCIO
,tb_vendas_gb.DESC_UN_NEGOCIO
,tb_vendas_gb.COD_CANAL_VENDA_TRATADO
,ROUND(SUM(tb_vendas_gb.VLR_VENDA), 2) AS VLR_VENDA_TOTAL
,COUNT(tb_vendas_gb.VLR_VENDA) AS QT_ITEM_TOTAL
 FROM `silver.tb_vendas_gb` as tb_vendas_gb
 group by 
 tb_vendas_gb.COD_UN_NEGOCIO
,tb_vendas_gb.DESC_UN_NEGOCIO
,tb_vendas_gb.COD_CANAL_VENDA_TRATADO
)