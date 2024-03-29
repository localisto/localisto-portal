class Agency < ActiveRecord::Base
   acts_as_list 
   
 has_many :portaluserassignments
 has_many :users, :through => :portaluserassignments

   has_many :projects, :dependent => :destroy
   self.table_name = 'agency'
  
   attr_accessible :included_by_default, :name, :sort_order, :user_publish, :admin_publish, :publisher, :archive
   attr_accessible :image_file_name

   validates :name, :presence => true

    before_update :check_publish

    def check_publish

    	if self.user_publish == true and self.admin_publish == true 
    		  self.disabled = 0
      
      else
         self.disabled = 1
     end

    end

end
