with 
    contas as (
        select *
        from {{ ref('stg_erp__contas') }}

    )

    , selecionar_colunas as (
        select 
            
            pk_num_conta
            , tipo_conta
            , ts_data_abertura
        from contas

    )

select *
from contas