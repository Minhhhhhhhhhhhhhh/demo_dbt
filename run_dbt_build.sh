#!/bin/zsh

# Go to the dbt project directory
cd /Users/dohaiminh/dbt-projects/dbt_pg_demo/demo_dag_pg

echo "================================================"
echo "Starting dbt build workflow..."
echo "Project: demo_project"
echo "================================================"
echo ""

# Run dbt build (Model + Test + Snapshot)
dbt build

# Lấy mã lỗi (exit code) của lệnh dbt build vừa chạy
EXIT_CODE=$?

echo ""
echo "================================================"
echo "dbt build completed!"
echo "Exit code: $EXIT_CODE"
echo "================================================"
echo ""

# Tương đương với lệnh 'pause' trên Windows
read -k 1 -s -r "?Press any key to continue..."
echo ""