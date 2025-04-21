FROM quay.io/astronomer/astro-runtime:12.8.0
# replace dbt-bigquery with another supported adapter if you're using a different warehouse type
RUN python -m venv dbt_venv && source dbt_venv/bin/activate && \
    pip install --no-cache-dir dbt-bigquery && deactivate
