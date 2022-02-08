class ApplicationRecord < ActiveRecord::Base
  require 'rest-client'
  require 'uri'
  require 'net/http' 
  
  self.abstract_class = true  
end  