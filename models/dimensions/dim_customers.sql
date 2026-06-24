

{{
    config(
        materialized = 'table'
    )
}}

SELECT 
    customer_id,
    customer_name,
    country,
    CURRENT_TIMESTAMP AS load_date
FROM {{ ref('dim_customers_snapshot') }}
WHERE dbt_valid_to IS NULL

