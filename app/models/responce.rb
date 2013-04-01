class Responce < ActiveRecord::Base
	
   before_update :update_image_fieldu
   after_create :update_image_field
   after_update :reprocess_image, :if => :cropping?

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
    
attr_accessible :question_id, :image, :description, :sort_order, :position, :image, :crop_x, :crop_y, :crop_w, :crop_h

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
      :styles => { :thumb => "150x105", :mobile  => '500x350#', :large => '700x700>' },
      :default_style => :original,
      :default_url => 'http://localisto.org/pixel.gif',
      :s3_headers => { 'Expires' => 1.year.from_now.httpdate },
      #:convert_options => { :all => '-strip -trim' }
      :processors => [:cropper]
  
  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end
  
  def image_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file("http://cdn.localisto.org" + image.path(style))
  end

 private

   def reprocess_image
    image.reprocess!
  end
 
  def update_image_field      
 self.image_url = self.image.url
  self.save
  end

   def update_image_fieldu     
self.image_url = self.image.url

  end

end
