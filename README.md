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


### Configuration
- Set up environment variables for all environments.
- Configure **Sidekiq** with **Redis**.
- Enable UUIDs for primary keys.
- Set up the legacy database connection.
- Configure **RSpec** as the default testing framework.
- Set up **ESLint** with **Prettier**.
- Configure **Tailwind CSS**.

### Database Setup
- Create the database: `rails db:create`
- Initialize schema: `rails db:migrate`

### How to Run the Test Suite
- Run tests with: `bundle exec rspec`

### Services
- **Sidekiq**: Background jobs
- **Redis**: Caching and job queues

* Deployment instructions

* ...
# Inertia on Rails with SSR enabled

 [Ruby on Rails](https://github.com/rails/rails), [Vite](https://github.com/vitejs/vite), and [InertiaJS](https://github.com/inertiajs/inertia-rails) I'd recommend checking out the following files:


- `app/javascript/pages/Dashboard.jsx`: The React component being rendered by the `/` route
- `app/controllers/dashboard_controller.rb`: The controller that handled rendering the root page
- `app/javascript/components/Layout.jsx`: The React component providing the "magic" layout similar to Rails's application layout
- `app/javascript/entrypoints/application.jsx`: The Vite entrypoint that handles initializing InertiaJS



To run locally:

```
bundle install
npm install
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
