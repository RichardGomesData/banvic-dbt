with 
    colaboradores as (
        select *
        from {{ ref('stg_erp__colaboradores') }}

    )

    , localidades as (
        select *
        from {{ ref('stg_erp__localidades') }}

    )

        , colaborador_agencia as (
        select *
        from {{ ref('stg_erp__colaborador_agencia') }}

    )
    , colaboradores_enriquecido as (
            select 
                colaboradores.pk_colaborador
                , colaboradores.fk_localidade
                , colaboradores.nome_colaborador
                , colaboradores.email_colaborador
                , colaboradores.cpf_colaborador
                , colaboradores.data_nascimento_colaborador
                , colaboradores.endereco_colaborador
                , colaboradores.cep_colaborador
                , colaboradores.cod_gerente
                , localidades.cidade as cidede_colaborador
                , localidades.uf as uf_colaborador
                , colaborador_agencia.fk_agencia as agencia_colaborador
            from colaboradores
            left join localidades 
            on colaboradores.fk_localidade = localidades.pk_localidade
            
            left join colaborador_agencia 
            on colaboradores.pk_colaborador = colaborador_agencia.fk_colaborador
    )
select *
from colaboradores_enriquecido