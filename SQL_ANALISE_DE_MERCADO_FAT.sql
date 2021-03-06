SELECT ALL TEXTIL5.VW_FATURAMENTO.ESTADO, 
           TEXTIL5.VW_FATURAMENTO.NIVEL_ESTRUTURA, 
           TEXTIL5.VW_FATURAMENTO.GRUPO_ESTRUTURA, 
           TEXTIL5.VW_FATURAMENTO.SUBGRU_ESTRUTURA, 
           TEXTIL5.VW_FATURAMENTO.ITEM_ESTRUTURA, 
           TEXTIL5.VW_FATURAMENTO.DESCR_REFERENCIA, 
           SUM(TEXTIL5.VW_FATURAMENTO.VALOR_CONTABIL) VL_FATURA
FROM TEXTIL5.VW_FATURAMENTO
WHERE (TEXTIL5.VW_FATURAMENTO.DATA_EMISSAO_NF BETWEEN '01-jan-05' AND '31-dec-06'
  AND TEXTIL5.VW_FATURAMENTO.NIVEL_ESTRUTURA IN (2, 7)
  AND (TEXTIL5.VW_FATURAMENTO.TIPO_MOEDA=1
   OR TEXTIL5.VW_FATURAMENTO.TIPO_MOEDA IS NULL))
GROUP BY TEXTIL5.VW_FATURAMENTO.ESTADO, 
         TEXTIL5.VW_FATURAMENTO.NIVEL_ESTRUTURA, 
         TEXTIL5.VW_FATURAMENTO.GRUPO_ESTRUTURA, 
         TEXTIL5.VW_FATURAMENTO.SUBGRU_ESTRUTURA, 
         TEXTIL5.VW_FATURAMENTO.ITEM_ESTRUTURA, 
         TEXTIL5.VW_FATURAMENTO.DESCR_REFERENCIA
ORDER BY TEXTIL5.VW_FATURAMENTO.ESTADO ASC, 
         SUM(TEXTIL5.VW_FATURAMENTO.VALOR_CONTABIL) DESC,
         TEXTIL5.VW_FATURAMENTO.NIVEL_ESTRUTURA ASC, 
         TEXTIL5.VW_FATURAMENTO.GRUPO_ESTRUTURA ASC, 
         TEXTIL5.VW_FATURAMENTO.SUBGRU_ESTRUTURA ASC, 
         TEXTIL5.VW_FATURAMENTO.ITEM_ESTRUTURA ASC, 
         TEXTIL5.VW_FATURAMENTO.DESCR_REFERENCIA ASC
         