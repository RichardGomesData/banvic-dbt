with
    fonte_colaboradores as (
        select *
        from {{ source('erp', 'colaboradores') }}

    )


    , renomeado as (
        select 
            cod_colaborador as pk_colaborador
            , cast (cod_localidade as int) as fk_localidade
            , primeiro_nome || ' ' || ultimo_nome as nome_colaborador
            , email
            , cpf
            , cast (data_nascimento as date) as data_nascimento_colaborador
            , endereco
            , regexp_replace (cep, '[^a-zA-Z0-9]', '') as cep_colaborador
            , cod_gerente
        from fonte_colaboradores
    )

select *
from renomeado