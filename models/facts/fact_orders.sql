{{
    config(
        materialized = 'incremental',
        unique_key = 'order_id',   
    )
}}


SELECT
    order_id,
    customer_id,
    product_name,
    product_category,
    order_date,
    extract(year from order_date)::int as order_year,
    quantity,
    price,
    quantity * price AS total_amount

FROM {{ source('demo_dag_sources', 'orders') }}

{% if is_incremental() %}

  WHERE order_id > (SELECT MAX(order_id) FROM {{ this }})

{% endif %}
