configure :development do
  # set :database, {
  #     adapter: 'postgresql',
  #     encoding: 'unicode',
  #     database: 'geojson_development',
  #     pool: 2,
  #     username: '',
  #     password: ''
  # }
  set :show_exceptions, true
end

configure :production do
  # set :database, {
  #     adapter: 'postgresql',
  #     encoding: 'unicode',
  #     database: 'geojson_production',
  #     pool: 2,
  #     username: '',
  #     password: ''
  # }
  # db = URI.parse(ENV['DATABASE_URL'] || 'postgres:///localhost/mydb')
  #
  # ActiveRecord::Base.establish_connection(
  #   :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
  #   :host     => db.host,
  #   :username => db.user,
  #   :password => db.password,
  #   :database => db.path[1..-1],
  #   :encoding => 'utf8'
  # )
end