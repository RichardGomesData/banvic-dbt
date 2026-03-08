with
    fonte_propostas_credito as (
        select *
        from {{ source('erp', 'propostas_credito') }}

    )


    , renomeado as (
        select 
            cast (cod_proposta as int) as pk_proposta
            , cast (cod_cliente as int) as fk_cliente
            , cast (cod_colaborador as int) as fk_colaborador
            , cast (data_entrada_proposta as timestamp) as ts_data_entrada_proposta
            , cast(taxa_juros_mensal as decimal(8,4)) as taxa_juros_mensal
            , cast (valor_proposta as decimal(18,2)) as valor_proposta
            , cast (valor_financiamento as decimal(18,2)) as valor_financiamento
            , cast (valor_entrada as decimal(18,2)) as valor_entrada
            , cast (valor_prestacao as decimal(18,2)) as valor_prestacao
            , cast (quantidade_parcelas as int) as quantidade_parcelas
            , cast (carencia as int) as carencia 
            , status_proposta
        from fonte_propostas_credito
    )

select *
from renomeado