class Portaluserassignment < ActiveRecord::Base
  attr_accessible :user_id, :agency_id
  belongs_to :user
  belongs_to :agency
end
