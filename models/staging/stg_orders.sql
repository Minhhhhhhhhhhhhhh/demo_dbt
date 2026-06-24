{{
    config(
        materialized = 'view'
    )
}}


SELECT 
    order_id,
    customer_id,
    product_name,
    product_category AS category,
    quantity,
    price,
    quantity * price AS total_amount
FROM {{ source('demo_dag_sources', 'orders') }}