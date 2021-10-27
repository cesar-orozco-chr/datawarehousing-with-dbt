from datetime import timedelta
from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from airflow.utils.dates import datetime, timedelta

DBT_PROJECT_DIR = '/usr/local/airflow/iowa_liquor_warehouse'

dag = DAG(
    "dbt_basic_dag",
    start_date=datetime(2020, 12, 23),
    default_args={"owner": "astronomer", "email_on_failure": False},
    description="A sample Airflow DAG to invoke dbt runs using a BashOperator",
    schedule_interval=None,
    catchup=False,
)

with dag:
    dbt_debug = BashOperator(
        task_id="dbt_compile",
        bash_command=f"dbt compile --project-dir {DBT_PROJECT_DIR} --profiles-dir {DBT_PROJECT_DIR}"
    )

    dbt_tests = BashOperator(
        task_id="dbt_test",
        bash_command=f"dbt test --project-dir {DBT_PROJECT_DIR} --profiles-dir {DBT_PROJECT_DIR}"
    )

    dbt_run = BashOperator(
        task_id="dbt_run",
        bash_command=f"dbt run --project-dir {DBT_PROJECT_DIR} --profiles-dir {DBT_PROJECT_DIR}"
    )
dbt_debug >> dbt_tests >> dbt_run