SELECT *
,DENSE_RANK() OVER (PARTITION BY tb_vendas_gb.COD_FRANQUIA ORDER BY tb_vendas_gb.VLR_VENDA_FRANQUIA_CATEGORIA DESC ) AS RANK_VENDA_FRANQUIA_CATEGORIA
FROM (
	SELECT
        tb_vendas.COD_FRANQUIA
        ,tb_franquia.NOME_FRANQUIA
        ,tb_material.DES_CATEGORIA
        ,ROUND(SUM(tb_vendas.VLR_VENDA) OVER (PARTITION BY tb_vendas.COD_FRANQUIA, tb_material.DES_CATEGORIA),2) AS VLR_VENDA_FRANQUIA_CATEGORIA
        FROM `bronze.tb_venda` as tb_vendas
        left join `bronze.tb_franquia` as tb_franquia on tb_vendas.COD_FRANQUIA = tb_franquia.COD_FRANQUIA
        left join `bronze.tb_material` as tb_material on tb_vendas.COD_MATERIAL = tb_material.COD_MATERIAL

        ) AS TB_vendas_gb
    GROUP BY
     TB_vendas_gb.COD_FRANQUIA
    ,TB_vendas_gb.NOME_FRANQUIA
    ,TB_vendas_gb.DES_CATEGORIA
    ,TB_vendas_gb.VLR_VENDA_FRANQUIA_CATEGORIA
    ORDER BY TB_vendas_gb.COD_FRANQUIA, RANK_VENDA_FRANQUIA_CATEGORIA