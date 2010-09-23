require 'active_record'

dbconfig = YAML.load(File.read('config/database.yml'))
ActiveRecord::Base.establish_connection dbconfig['production']

class ActiveRecord::Schema
  def self.add(options, &block)
    if (ActiveRecord::Base.connection.select_value("SELECT 'found' FROM schema_migrations WHERE version = " + options[:version]) rescue nil) != 'found'
      self.define(options, &block)
    end
  end
end

# Schema

ActiveRecord::Schema.add(:version => 1) do
  create_table :visits, :force => true do |t|
    t.string :uid
    t.string :landing_page
    t.string :referrer
    t.timestamps
  end

  add_index :visits, :uid
end

# Models

class Visit < ActiveRecord::Base
  validates_presence_of :uid
end

