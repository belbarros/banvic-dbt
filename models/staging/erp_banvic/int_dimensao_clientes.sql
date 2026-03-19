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
            clientes.* except (fk_localidade)
            , localidades.cidade as cidade_cliente
            , localidades.uf as uf_cliente
        from clientes
        left join localidades on clientes.fk_localidade = localidades.pk_localidade
    )

select *
from clientes_enriquecido