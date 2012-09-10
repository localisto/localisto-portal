module ApplicationHelper


  def flash_class(level)
    case level
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-error"
    when :alert then "alert alert-error"
    end
  end



def qtyper (qtype)
	if qtype == '1'
	raw("Image") 
	elsif qtype == '2'
	raw("Text") 

	elsif qtype == '3'
	raw("Pairwise") 
	end
end

def qtypera (qtype)
	if qtype == '1'
	raw("an image") 
	elsif qtype == '2'
	raw("text") 

	elsif qtype == '3'
	raw("a pairwise") 
	end
end




end


