with 
    clientes as (
        select *
        from {{ ref('int_dimensao_colaboradores') }}
    )
select * 
from clientes 
