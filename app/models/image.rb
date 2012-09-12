class Image < ActiveRecord::Base
  
  after_update :update_image_field
  #after_update :update_image_field

  set_table_name "project_image"
  acts_as_list 
  attr_accessible :project_id, :image, :image_url
  belongs_to :project

validates :image, :attachment_presence => true

has_attached_file :image,
      :storage => 's3',
      :s3_credentials => "config/config.yml",
      :bucket => 'localisto-app',
      :s3_host_alias => 'cdn.localisto.org',
      :url => ':s3_alias_url',
      :path => "/project_images/:style/:id/:filename",
      :styles => { :thumb  => '120x120' },
      :default_style => :original,
      :default_url => 'http://localisto.org/pixel.gif',
      :s3_headers => { 'Expires' => 1.year.from_now.httpdate },
      :convert_options => { :all => '-strip -trim' }
  

private
  def update_image_field      
  
  self.image_url = self.image.url
  self.save
  end


end
