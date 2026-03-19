with
    colaboradores as (
        select *
        from {{ ref('stg_erp__colaboradores') }}
    )

    , localidades as (
        select *
        from {{ ref('stg_erp__localidades') }}
    )

    , colaboradores_enriquecido as (
        select
            colaboradores.* except (fk_localidade)
            , localidades.cidade as cidade_colaborador
            , localidades.uf as uf_colaborador
        from colaboradores
        left join localidades on colaboradores.fk_localidade = localidades.pk_localidade
    )

select *
from colaboradores_enriquecido