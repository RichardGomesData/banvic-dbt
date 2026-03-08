with
    fonte_propostas_credito as (
        select *
        from {{ source('erp', 'propostas_credito') }}

    )


    , renomeado as (
        select 
            cod_proposta
            , cod_cliente
            , cod_colaborador
            , data_entrada_proposta
            , taxa_juros_mensal
            , valor_proposta
            , valor_financiamento
            , valor_entrada
            , valor_prestacao
            , quantidade_parcelas
            , carencia
            , status_proposta
        from fonte_propostas_credito
    )

select *
from renomeado