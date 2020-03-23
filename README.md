## This application is built on top of sinatra and exposes 3 geoJson APIs

### Getting Started

#### Configure config/database.yml to connect to pg server
`database: YOUR_DATABASE_NAME`

`username: YOUR_PG_USERNAME`

`password: YOUR_PG_PASSWORD`


#### Create databse and run migrations
`rake db:create && rake db:migrate`


#### Run the application server
`ruby app.rb`