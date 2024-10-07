
# README

This README would normally document whatever steps are necessary to get the
application up and running.

### Ruby Version

- **3.3.0**

### Rails Version

- **7.2.0**

### System Dependencies

- **PostgreSQL**
- **Redis**
- **Node.js** and **Yarn**

## Setup Instructions

1. Install Ruby dependencies:

   ```bash
   bundle install
   ```

2. Install JS dependencies:

   ```bash
   yarn
   ```

## Database Setup

- Create you env fible and replace values with your own

```bash
cp .env-example .env
```

- Create your databases and run migrations

```bash
bin/rails db:create 
bin/rails db:migrate
```

### Legacy local db setup

- Download the legacy db dump [here](https://www.notion.so/peach-technology/Technical-Discovery-Documents-1150aac4e9344594af2de3eeec459123?p=9cd75f5063eb40c58d56e70207228e9a&pm=s) and save it at the root of your project directory

- After the getting the dump, dump the database into your local database

```
psql -U <your_db_user> -d peach -h localhost -f /path/to/your/project/db_backup.sql
```

## Migrations after setup

- To ensure there are no unexpected changes on primary or legacy databases, ensure you specify which db you want to migrate ie

```bash
bin/rails db:create:primary #To re-create primary database 
bin/rails db:create:legacy  #To re-create legacy database 
bin/rails db:migrate:primary #To run primary migrations
bin/rails db:migrate:legacy # To run legacy migrations
```

It’s a good practice to back up your databases before running migrations to avoid data loss.

### How to Run the Test Suite

- Run tests with: `bundle exec rspec`

### Services

- **Sidekiq**: Background jobs
- **Redis**: Caching and job queues

- Deployment instructions

# Inertia on Rails with SSR enabled

[Ruby on Rails](https://github.com/rails/rails), [Vite](https://github.com/vitejs/vite), and [InertiaJS](https://github.com/inertiajs/inertia-rails)

To run locally:

```
bundle install
yarn
./bin/dev

```

To create an SSR build:

```
bin/vite build --ssr
```

To start the SSR node.js server:

```
bin/vite ssr
```
