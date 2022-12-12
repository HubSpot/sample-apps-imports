# HubSpot-python CRM-imports sample app

### Requirements

1. Make sure you have [Python 3.8+](https://www.python.org/downloads/) installed.
2. [Configured](https://github.com/HubSpot/sample-apps-imports/blob/master/README.md#how-to-run-locally) .env file

### Running

1. Install dependencies

```
pip3 install -r requirements.txt
```

2. Commands

Show all commands (get help)

```
python cli.py -h
```

Get imports

```
python cli.py -m get_page
```

Get an import by id

```
python cli.py  -m get_by_id -i [import_id]
```

Create an import

```
python cli.py -m create -f [filename] -c [columns_config]
```

Example:

```
python cli.py -m create -f import_emails.csv -c '[
    {
      "columnName": "First Name",
      "propertyName": "firstname",
      "columnObjectType": "CONTACT"
     },
    {
      "columnName": "Email",
      "propertyName": "email",
      "columnObjectType": "CONTACT" 
     }
     ]'
```

Cancel an import

```bash
python cli.py -m cancel -i [import_id]
```
