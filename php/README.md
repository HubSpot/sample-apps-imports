# HubSpot PHP Imports Contacts App

Currently, this app focuses on demonstrating the functionality of [Imports API](https://developers.hubspot.com/docs/api/crm/imports) endpoints and their related actions.

Please see the documentation on [Creating an app in HubSpot](https://developers.hubspot.com/docs-beta/creating-an-app)

### HubSpot Public API endpoints used in this application

  - [Imports](https://developers.hubspot.com/docs/api/crm/imports)

### Setup App

Make sure you have [Docker Compose](https://docs.docker.com/compose/) installed.

### Configure

1. Copy .env.template to .env
2. Paste your HUBSPOT_API_KEY

### Running

The best way to run this project (with the least configuration), is using docker compose.  Change to the webroot and start it

```bash
docker-compose up -d --build
```
You should now be able to navigate to [http://localhost:8999](http://localhost:8999) and use the application.
