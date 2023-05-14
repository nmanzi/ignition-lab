#!/bin/bash

docker compose down
docker volume rm ignition_ignition-data -f
docker volume rm ignition_sql-data -f