
{% snapshot dim_customers_snapshot %}

{{
    config(
        
        unique_key = 'customer_id',
        strategy = 'check',
        check_cols = 'all',
        target_database = 'dbt_test',
        target_schema = 'demo_dag'
    )
}}

SELECT 
    customer_id,
    customer_name,
    country
FROM {{ ref('stg_customers') }}

{% endsnapshot %}