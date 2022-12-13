# HubSpot-ruby CRM-imports sample app

### Requirements

1. ruby 3.1.3
2. [Configured](https://github.com/HubSpot/sample-apps-imports/blob/master/README.md#how-to-run-locally) .env file

### Running

1. Install dependencies

```
bundle install
```

2. Commands

Show all commands (get help)

```
ruby cli.rb -h
```

Get imports

```
ruby cli.rb -m get_page
```

Get an import by id

```
ruby cli.rb -m get_by_id -i [import_id]
```

Create an import

```
ruby cli.rb -m create -f [filename] -c [columns_config]
```

Example:

```
ruby cli.rb -m create -f import_emails.csv -c '[{"columnName": "First Name", "propertyName": "firstname", "columnObjectType": "CONTACT"}, {"columnName": "Email", "propertyName": "email", "columnObjectType": "CONTACT" }]'
```

Cancel an import

```bash
ruby cli.rb -m cancel -i [import_id]
```
