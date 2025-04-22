Overview
========

Welcome to Astronomer! This project was generated after you ran 'astro dev init' using the Astronomer CLI. This readme describes the contents of the project, as well as how to run Apache Airflow on your local machine.

Project Contents
================

Your Astro project contains the following files and folders:

- dags: This folder contains the Python files for your Airflow DAGs. By default, this directory includes one example DAG:
    - `example_astronauts`: This DAG shows a simple ETL pipeline example that queries the list of astronauts currently in space from the Open Notify API and prints a statement for each astronaut. The DAG uses the TaskFlow API to define tasks in Python, and dynamic task mapping to dynamically print a statement for each astronaut. For more on how this DAG works, see our [Getting started tutorial](https://www.astronomer.io/docs/learn/get-started-with-airflow).
- Dockerfile: This file contains a versioned Astro Runtime Docker image that provides a differentiated Airflow experience. If you want to execute other commands or overrides at runtime, specify them here.
- include: This folder contains any additional files that you want to include as part of your project. It is empty by default.
- packages.txt: Install OS-level packages needed for your project by adding them to this file. It is empty by default.
- requirements.txt: Install Python packages needed for your project by adding them to this file. It is empty by default.
- plugins: Add custom or community plugins for your project to this file. It is empty by default.
- airflow_settings.yaml: Use this local-only file to specify Airflow Connections, Variables, and Pools instead of entering them in the Airflow UI as you develop DAGs in this project.

Deploy Your Project Locally
===========================

1. Start Airflow on your local machine by running 'astro dev start'.

This command will spin up 4 Docker containers on your machine, each for a different Airflow component:

- Postgres: Airflow's Metadata Database
- Webserver: The Airflow component responsible for rendering the Airflow UI
- Scheduler: The Airflow component responsible for monitoring and triggering tasks
- Triggerer: The Airflow component responsible for triggering deferred tasks

2. Verify that all 4 Docker containers were created by running 'docker ps'.

Note: Running 'astro dev start' will start your project with the Airflow Webserver exposed at port 8080 and Postgres exposed at port 5432. If you already have either of those ports allocated, you can either [stop your existing Docker containers or change the port](https://www.astronomer.io/docs/astro/cli/troubleshoot-locally#ports-are-not-available-for-my-local-airflow-webserver).

3. Access the Airflow UI for your local Airflow project. To do so, go to http://localhost:8080/ and log in with 'admin' for both your Username and Password.

You should also be able to access your Postgres Database at 'localhost:5432/postgres'.

Deploy Your Project to Astronomer
=================================

If you have an Astronomer account, pushing code to a Deployment on Astronomer is simple. For deploying instructions, refer to Astronomer documentation: https://www.astronomer.io/docs/astro/deploy-code/

Contact
=======

The Astronomer CLI is maintained with love by the Astronomer team. To report a bug or suggest a change, reach out to our support.

# Setup Airbyte

Make sure Docker is running

## Install abctl cli

`curl -LsfS https://get.airbyte.com | bash -`

## Run Airbyte in a container

`abctl local install`

## Additional links

https://docs.airbyte.com/using-airbyte/getting-started/oss-quickstart?_gl=1*zn15cq*_gcl_au*MTQ5MTA1NjQ3MC4xNzIxMjM1NDcy
https://docs.airbyte.com/deploying-airbyte/integrations/authentication

# Setup DBT et Astro Airflow

## Install Astronomer cli and create an astro project

`curl -sSL install.astronomer.io | sudo bash -s`

`mkdir name_your_project`

`astro dev init`

## Configure your project

In the docker file add :

`# replace dbt-postgres with another supported adapter if you're using a different warehouse type
RUN python -m venv dbt_venv && source dbt_venv/bin/activate && \
    pip install --no-cache-dir dbt-postgres && deactivate`

replace dbt-postgres by your dbt adapter

In the requirements file add this package:

`astronomer-cosmos
apache-airflow-providers-postgres==5.6.0`

Adapt the last package providers by your database

## Additionnal links

https://www.astronomer.io/docs/learn/airflow-dbt/
https://www.astronomer.io/docs/learn/connections/bigquery/
https://astronomer.github.io/astronomer-cosmos/profiles/GoogleCloudServiceAccountFile.html
https://airflow.apache.org/docs/apache-airflow-providers-google/stable/_api/airflow/providers/google/cloud/operators/bigquery/index.html#airflow.providers.google.cloud.operators.bigquery.BigQueryGetDataOperator

# Setup Metabase

## Pull image 

`docker pull metabase/metabase:latest`

## Run container

`docker run -d -p 3000:3000 --name metabase metabase/metabase`

## Additional links
https://www.metabase.com/docs/latest/installation-and-operation/running-metabase-on-docker

# Generate dbt docs server

dbt docs serve --port 2223

Because default port 8080 is used by airflow
Documentation is available in Bigquery also
