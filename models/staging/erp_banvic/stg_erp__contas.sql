with
    fonte_contas as (
        select *
        from {{ source('erp', 'contas') }}

    )


    , renomeado as (
        select 
            cast (num_conta as int) as pk_num_conta
            , cast (cod_cliente as int) as fk_cod_cliente
            , cast (cod_agencia as int) as fk_cod_agencia
            , cast (cod_colaborador as int) as fk_cod_colaborador
            , cast (tipo_conta as string) as tipo_conta
            , cast (data_abertura as timestamp) as ts_data_abertura
            , cast(saldo_total as decimal(18,2)) as saldo_total
            , cast(saldo_disponivel as decimal(18,2)) as saldo_disponivel
            , cast (data_ultimo_lancamento as timestamp) as ts_data_ultimo_lancamento
        from fonte_contas
    )

select *
from renomeado