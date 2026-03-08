with 
    clientes as (
        select *
        from {{ ref('int_dimensao_agencias') }}
    )
select * 
from clientes 
