with date_spine as (

    {{
        dbt_utils.date_spine(
            datepart = "day",
            start_date = "cast('2000-01-01' as date)",
            end_date = "cast('2030-01-01' as date)"
        )
    }}

),

criar_datas as (

select
    row_number() over(order by date_day) as pk_data
    , cast(date_day as date) as data_completa

    , extract(day from date_day) as dia

    , case extract(dow from date_day)
        when 1 then 'domingo'
        when 2 then 'segunda-feira'
        when 3 then 'terça-feira'
        when 4 then 'quarta-feira'
        when 5 then 'quinta-feira'
        when 6 then 'sexta-feira'
        when 7 then 'sábado'
      end as dia_semana_nome

    , case extract(month from date_day)
        when 1 then 'janeiro'
        when 2 then 'fevereiro'
        when 3 then 'março'
        when 4 then 'abril'
        when 5 then 'maio'
        when 6 then 'junho'
        when 7 then 'julho'
        when 8 then 'agosto'
        when 9 then 'setembro'
        when 10 then 'outubro'
        when 11 then 'novembro'
        when 12 then 'dezembro'
      end as mes

    , extract(year from date_day) as ano

    , concat('T', extract(quarter from date_day)) as trimestre_nome

    , case 
        when extract(dow from date_day) in (1,7) then true
        else false
      end as is_final_de_semana

    , case 
        when extract(day from date_day) % 2 = 1 then true
        else false
      end as is_dia_impar

from date_spine

)

select *
from criar_datas