class Consultant
  include Mongoid::Document
  field :full_name, type: String
  field :skills, type: Hash
  field :working_office, type: String
end