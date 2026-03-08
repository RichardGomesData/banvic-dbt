with
    fonte_transacoes as (
        select *
        from {{ source('erp', 'transacoes') }}

    )


    , renomeado as (
        select 
            cod_transacao as pk_transacao
            , cast (num_conta as int) as fk_num_conta
            , cast (data_transacao as timestamp) as data_transacao
            , cast (nome_transacao as string) as nome_transacao
            , cast(valor_transacao as decimal(18,2)) as valor_transacao
        from fonte_transacoes
    )

select *
from renomeado