class Agency < ActiveRecord::Base
   acts_as_list 
   
   has_many :projects, :dependent => :destroy
   self.table_name = 'agency'
  
   attr_accessible :included_by_default, :name, :sort_order
   attr_accessible :image_file_name

   validates :name, :presence => true

end
