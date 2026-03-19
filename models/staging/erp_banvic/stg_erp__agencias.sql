with
    fonte_agencias as (
        select *
        from {{ source('erp', 'agencias') }}
    )
    , renomeado as (
        select
        cod_agencia as pk_agencia
        , cod_localidade as fk_localidade
        , nome as nome_agencia
        , endereco as endereco_agencia
        , cast(data_abertura as date) data_abertura_agencia
        , tipo_agencia
        from fonte_agencias
    )

select *
from renomeado
