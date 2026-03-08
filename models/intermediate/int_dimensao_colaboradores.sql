with 
    clientes as (
        select *
        from {{ ref('stg_erp__clientes') }}

    )

    , localidades as (
        select *
        from {{ ref('stg_erp__localidades') }}

    )
    , clientes_enriquecido as (
            select 
                clientes.pk_cliente
                , clientes.nome_cliente
                , clientes.email_cliente
                , clientes.tipo_cliente
                , clientes.cpfcnpj_cliente
                , clientes.ts_inclusao
                , clientes.data_nascimento_cliente
                , clientes.endereco_cliente
                , clientes.ceo_cliente
                , localidades.cidade as cidede_cliente
                , localidades.uf as uf_cliente
            from clientes
            left join localidades on clientes.fk_localidade = localidades.pk_localidade
    )
select *
from clientes_enriquecido