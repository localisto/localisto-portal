class Responce < ActiveRecord::Base
	
   before_update :update_image_fieldu
    after_create :update_image_field
    
attr_accessible :question_id, :image, :description, :sort_order, :position, :image
	belongs_to :question
	self.table_name = "answer"
	acts_as_list
	
	has_attached_file :image,
      :storage => 's3',
      :s3_credentials => "config/config.yml",
      :bucket => 'localisto-app',
      :s3_host_alias => 'cdn.localisto.org',
      :url => ':s3_alias_url',
      :path => "/responces/:style/:id/:filename",
      :styles => { :thumb  => '120x120#' },
      :default_style => :original,
      :default_url => 'http://localisto.org/pixel.gif',
      :s3_headers => { 'Expires' => 1.year.from_now.httpdate },
      :convert_options => { :all => '-strip -trim' }
  

 private
  def update_image_field      
 self.image_url = self.image.url
  self.save
  end

   def update_image_fieldu     
self.image_url = self.image.url

  end

end
