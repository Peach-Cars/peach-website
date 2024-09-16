
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

### Database Setup

## Legacy local db setup

- Get the database dump using this command:

```
pg_dump -U <user> -h <rds host url> peachapi > db_dump_backup.sql
```

- After the getting the dump, dump the database into your local database

```
psql -U <db_user> -d <local_database_name> -h localhost -f /path/to/your/db_dump_backup.sql
```

- Create the database: `rails db:create`
- Initialize schema: `rails db:migrate`

### How to Run the Test Suite

- Run tests with: `bundle exec rspec`

### Services

- **Sidekiq**: Background jobs
- **Redis**: Caching and job queues

* Deployment instructions

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
