with 
    contas as (
        select *
        from {{ ref('stg_erp__contas') }}

    )

    , selecionar_colunas as (
        select 
            
            pk_num_conta
            , fk_cod_cliente
            , fk_cod_agencia
            , fk_cod_colaborador
            , saldo_total
            , saldo_disponivel
            , ts_data_ultimo_lancamento
        from contas

    )

select *
from contas