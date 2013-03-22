
class Project < ActiveRecord::Base
  #set_table_name "project"
  self.table_name = 'project'

  before_update :update_image_fieldu
  after_create :update_image_field
  before_update :check_publish
  before_save :encodetext


  has_many :images, :dependent => :destroy
  has_many :questions, :dependent => :destroy
  belongs_to :agency


  validates :title, :presence => true
  validates :image, :presence => true


  attr_accessible :agency_id, :title, :description, :location, :coordinates, :survey_closes, :meeting_starts, :has_survey, :fb_page_url, :disabled, :time, :date, :image, :grid_image, :meeting_time, :user_publish, :admin_publish, :archive

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

  def encodetext

    # ---  Some charaters such as ’ and — causes the entire block of text on iphone to not show up --- 
    self.description = self.description.gsub("\u2019", "\u0027")
    self.description = self.description.gsub("\u2018", "\u0027")
    self.description = self.description.gsub("\u2014", "--")
    self.description = self.description.gsub("\u2013", "--")
    self.description = self.description.gsub("\u00E9", "e")
    self.description = self.description.gsub("\u0027", "c")

   

    self.title = self.title.gsub("\u2019", "\u0027")
    self.title = self.title.gsub("\u2018", "\u0027")
    self.title = self.title.gsub("\u2014", "--")
    self.title = self.title.gsub("\u2013", "--")
    self.title = self.title.gsub("\u00E9", "e")
     self.title = self.title.gsub("\u0027", "c")

  end



  def update_image_field
    self.grid_image = self.image.url
    self.save
  end

  def update_image_fieldu
    self.grid_image = self.image.url

  end


  def check_publish

    if self.user_publish == true and self.admin_publish == true
      self.disabled = 0

    else
      self.disabled = 1
    end

  end




end
