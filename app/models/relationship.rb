class Relationship < ActiveRecord::Base
  belongs_to :applicant
  belongs_to :person
  attr_accessible :kind
end
