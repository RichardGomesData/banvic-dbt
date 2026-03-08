with
    fonte_agencias as (
        select *
        from {{ source('erp', 'agencias') }}

    )


    , renomeado as (
        select 
            cod_agencia as pk_agencia
            , nome
            , endereco
            , cod_localidade
            , data_abertura
            , tipo_agencia
        from fonte_agencias
    )

select *
from renomeado