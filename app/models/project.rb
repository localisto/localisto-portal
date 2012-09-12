
class Project < ActiveRecord::Base
	set_table_name "project"
	
	before_update :update_image_fieldu
    after_create :update_image_field
	
	has_many :images, :dependent => :destroy
	has_many :questions, :dependent => :destroy
	belongs_to :agency


    attr_accessible :agency_id, :title, :description, :location, :coordinates, :survey_closes, :meeting_starts, :has_survey, :fb_page_url, :disabled, :time, :date, :image, :grid_image, :meeting_time
   
   has_attached_file :image,
      :storage => 's3',
      :s3_credentials => "config/config.yml",
      :bucket => 'localisto-app',
      :s3_host_alias => 'cdn.localisto.org',
      :url => ':s3_alias_url',
      :path => "/grid_images/:style/:id/:filename",
      :styles => { :thumb  => '120x120#' },
      :default_style => :original,
      :default_url => 'http://localisto.org/pixel.gif',
      :s3_headers => { 'Expires' => 1.year.from_now.httpdate },
      :convert_options => { :all => '-strip -trim' }
  
private
  def update_image_field      
  self.grid_image = self.image.url
  self.save
  end

   def update_image_fieldu     
  self.grid_image = self.image.url
 
  end
end
