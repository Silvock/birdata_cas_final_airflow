from airflow import DAG
from airflow.utils.dates import days_ago
from pendulum import datetime
from airflow.providers.airbyte.operators.airbyte import AirbyteTriggerSyncOperator

with DAG(dag_id='trigger_airbyte_job',
         default_args={'owner': 'airflow'},
         schedule_interval=None,
         start_date=datetime(2025,4,21)
    ) as dag:

    money_to_json = AirbyteTriggerSyncOperator(
        task_id='move_gdrive_data_to_bq',
        airbyte_conn_id='airbyte_conn',
        connection_id='d571c1fa-278c-47ba-9538-e259581de15a',
        asynchronous=False,
        timeout=3600,
        wait_seconds=3
    )
