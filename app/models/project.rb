
class Project < ActiveRecord::Base
  #set_table_name "project"
  self.table_name = 'project'

  before_update :update_image_fieldu
  after_create :update_image_field
  before_update :check_publish
  before_save :housekeeping
  after_update :reprocess_image, :if => :cropping?


  has_many :images, :dependent => :destroy
  has_many :questions, :dependent => :destroy
  belongs_to :agency


  validates :title, :presence => true
  validates :image, :presence => true

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  attr_accessible :agency_id, :title, :description, :location, :coordinates, :survey_closes, :meeting_starts, :has_survey, :fb_page_url, :disabled, :time, :date, :image, :grid_image, :meeting_time, :user_publish, :admin_publish, :archive, :crop_x, :crop_y, :crop_w, :crop_h


  has_attached_file :image,
    :storage => 's3',
    :s3_credentials => "config/config.yml",
    :bucket => 'localisto-app',
    :s3_host_alias => 'cdn.localisto.org',
    :url => ':s3_alias_url',
    :path => "/grid_images/:style/:id/:filename",
    :styles => { :thumb  => '230x246#', :mobile=> '150x150#', :large => '500x500>' },
    :default_style => :original,
    :default_url => 'http://localisto.org/pixel.gif',
    :s3_headers => { 'Expires' => 1.year.from_now.httpdate },
    #:convert_options => { :all => '-strip -trim' },
    :processors => [:cropper]



  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end
  
  def image_geometry(style = :original)
    @geometry ||= {}
    #path = (image.options[:storage]==:s3) ? image.url(style) : image.path(style)
    @geometry[style] ||= Paperclip::Geometry.from_file("http://cdn.localisto.org" + image.path(style))
    #"http://cdn.localisto.org" + 
  end


  private

    def reprocess_image
    image.reprocess!
  end

  def housekeeping

    # ---  Some charaters such as ’ and — causes the entire block of text on iphone to not show up --- 
    self.description = self.description.gsub("\u2019", "\u0027")
    self.description = self.description.gsub("\u2018", "\u0027")
    self.description = self.description.gsub("\u2014", "--")
    self.description = self.description.gsub("\u2013", "--")
    self.description = self.description.gsub("\u00E9", "e")
    self.description = self.description.gsub("\u00E7", "c")
    self.description = self.description.gsub("\u2026", "...")


    self.title = self.title.gsub("\u2019", "\u0027")
    self.title = self.title.gsub("\u2018", "\u0027")
    self.title = self.title.gsub("\u2014", "--")
    self.title = self.title.gsub("\u2013", "--")
    self.title = self.title.gsub("\u00E9", "e")
    self.title = self.title.gsub("\u00E7", "c")
    self.title = self.title.gsub("\u2026", "...")

    self.location = self.location.gsub("\u2019", "\u0027")
    self.location = self.location.gsub("\u2018", "\u0027")
    self.location = self.location.gsub("\u2014", "--")
    self.location = self.location.gsub("\u2013", "--")
    self.location = self.location.gsub("\u00E9", "e")
    self.location = self.location.gsub("\u00E7", "c")
    self.location = self.location.gsub("\u2026", "...")



#----- Remove Parentheses from coordinates supplied by google maps api --#
   # self.coordinates = self.coordinates.gsub("(", "")
   #   self.coordinates = self.coordinates.gsub(")", "")
      
      
      if self.questions.count > 0
      self.has_survey = 1
      else
      self.has_survey = 0
      end

  end



  def update_image_field
    self.grid_image = self.image.url(:mobile)
    self.save
  end

  def update_image_fieldu
    self.grid_image = self.image.url(:mobile)

  end


  def check_publish

    if self.user_publish == true and self.admin_publish == true
      self.disabled = 0

    else
      self.disabled = 1
    end

  end




end
