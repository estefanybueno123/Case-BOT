CREATE TABLE
  silver.tb_vendas_gb
AS (
  SELECT 
 tb_venda.*
,tb_un_negocio.DESC_UN_NEGOCIO
,tb_material.DES_CATEGORIA
,tb_material.DES_MATERIAL
,tb_franquia.NOME_FRANQUIA
,tb_franquia.LOGRADOURO
,tb_franquia.CIDADE
,tb_franquia.ESTADO
,CASE WHEN tb_un_negocio.COD_UN_NEGOCIO NOT IN('BOT', 'EUD') THEN 'LOJ' ELSE tb_venda.COD_CANAL_VENDA END AS COD_CANAL_VENDA_TRATADO
 FROM `case-bot-374622.bronze.tb_venda` as tb_venda
 left join `bronze.tb_un_negocio` as tb_un_negocio on tb_venda.COD_UN_NEGOCIO = tb_un_negocio.COD_UN_NEGOCIO
 left join `bronze.tb_material` as tb_material on tb_venda.COD_MATERIAL = tb_material.COD_MATERIAL
 left join `bronze.tb_franquia` as tb_franquia on tb_venda.COD_FRANQUIA = tb_franquia.COD_FRANQUIA
)