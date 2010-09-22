require 'sequel'

Sequel::Model.plugin :timestamps

DB = Sequel.connect(ENV['DATABASE_URL'] || 'sqlite:///tmp/my.db')

# create an items table
DB.create_table? :visits do
  primary_key :id
  String :visitor
  String :landing_page
  String :referrer
  Time :created_at
  Time :updated_at
end

