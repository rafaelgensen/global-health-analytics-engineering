import os
import functions_framework
import requests
from google.cloud import bigquery

API_URL = "https://ghoapi.azureedge.net/api/Indicator"
TABLE = "who_raw"

@functions_framework.http
def main(request):
    project_id = os.getenv("PROJECT_ID")
    dataset_id = f"{project_id}_bronze"
    table_id = f"{project_id}.{dataset_id}.{TABLE}"

    resp = requests.get(API_URL)
    resp.raise_for_status()
    data = resp.json().get("value", [])

    if not data:
        return ("no data", 200)

    bq = bigquery.Client(project=project_id)
    errors = bq.insert_rows_json(table_id, data)

    if errors:
        return (str(errors), 500)

    return ("ok", 200)
