import os
import argparse
import json
from dotenv import load_dotenv
from hubspot import HubSpot


def access_token():
    load_dotenv()
    return os.environ['ACCESS_TOKEN']


def import_request(csv_filename, column_mapping):
    return {
      "name": "test_import",
      "files": [
        {
          "fileName": csv_filename,
          "fileImportPage": {
            "hasHeader": True,
            "columnMappings": json.loads(column_mapping)
          }
        }
      ]
    }


parser = argparse.ArgumentParser(description='Parse Hubspot API arguments')
parser.add_argument('-m', '--method', help='Method to run')
parser.add_argument('-i', '--import_id', help='Import id')
parser.add_argument('-f', '--files', help='CSV filename')
parser.add_argument('-c', '--column', help='Column mapping config')
parser.add_argument('-k', '--kwargs', help='kwargs to pass')
args = parser.parse_args()

if args.method is None:
    raise Exception('Please, provide method with -m or --method. See --help to get more info.')

api_client = HubSpot(access_token=access_token())
api = api_client.crm.imports.core_api

kwargs = vars(args)
filtered_kwargs = {
  k: v for k, v in kwargs.items() if v is not None and k != 'method' and k != 'column' and k != 'properties'
}
if args.method == 'create':
    import_request = import_request(csv_filename=args.files, column_mapping=args.column)
    filtered_kwargs['import_request'] = json.dumps(import_request)

result = getattr(api, args.method)(**filtered_kwargs)
print(result)
