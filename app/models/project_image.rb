class ProjectImage < ActiveRecord::Base
  before_save :update_image_field

  self.table_name = 'project_image'
  acts_as_list
  attr_accessible :project_id, :image

  #has_attached_file :image

  has_attached_file :image
  #attr_accessor :image
 validates :image, :attachment_presence => true

end


def update_image_field

#self.image_url = self.image.url.sub("http://s3.amazonaws.com/localisto-app-test/", "htt://cdn.localisto.org/")

self.image_url = self.image.url
end