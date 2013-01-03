# -*- encoding : utf-8 -*-
require 'active_record'
require 'untied-consumer-sync'

module SetupActiveRecord
  # Connection
  ar_config = { :test => { :adapter => 'sqlite3', :database => ":memory:" } }
  ActiveRecord::Base.configurations = ar_config
  ActiveRecord::Base.
    establish_connection(ActiveRecord::Base.configurations[:test])

  # Schema
  ActiveRecord::Schema.define do
    create_table :users, :force => true do |t|
      t.string :my_id
      t.string :login
      t.string :name
      t.boolean :zombie, :default => true
      t.timestamps
    end
  end

  # Models
  class ::User < ActiveRecord::Base
    include Untied::Consumer::Sync::Zombificator::ActsAsZombie

    validates_presence_of :login
  end
end
