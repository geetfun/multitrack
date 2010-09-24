require 'active_record'

dbconfig = YAML.load(File.read('config/database.yml'))
ActiveRecord::Base.establish_connection dbconfig['production']

ActiveRecord::Base.default_timezone = :utc

class ActiveRecord::Schema
  def self.apply(options, &block)
    if (ActiveRecord::Base.connection.select_value("SELECT 'found' FROM schema_migrations WHERE version = #{options[:version]}") rescue nil) != 'found'
      self.define(options, &block)
    end
  end
end

# Schema

ActiveRecord::Schema.apply(:version => 1) do
  create_table :visits, :force => true do |t|
    t.string :uid
    t.string :landing_page
    t.string :referrer
    t.datetime :created_at
  end

  add_index :visits, :uid
  add_index :visits, :created_at
end

# Models

class Visit < ActiveRecord::Base
  validates_presence_of :uid
end

