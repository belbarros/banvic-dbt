with
    agencias as (
        select *
        from {{ ref('stg_erp__agencias') }}
    )

    , localidades as (
        select *
        from {{ ref('stg_erp__localidades') }}
    )

    , agencias_enriquecido as (
        select
            agencias.* except (fk_localidade)
            , localidades.cidade as cidade_agencia
            , localidades.uf as uf_agencia
        from agencias
        left join localidades on agencias.fk_localidade = localidades.pk_localidade
    )

select *
from agencias_enriquecido