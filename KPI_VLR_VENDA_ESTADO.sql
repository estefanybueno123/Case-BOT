SELECT
tb_franquia.ESTADO
,SUM(tb_vendas.VLR_VENDA) AS VLR_VENDA_ESTADO
FROM `bronze.tb_venda` AS tb_vendas
left join `bronze.tb_franquia` as tb_franquia on tb_vendas.COD_FRANQUIA = tb_franquia.COD_FRANQUIA
group by
tb_franquia.ESTADO