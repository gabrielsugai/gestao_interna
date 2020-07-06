class Api::V1::ApiController < ActionController::API
  include AbstractController::Translation
  rescue_from ActiveRecord::RecordNotFound, with: :not_found


private

  def not_found(exception)
    binding.pry
    exeception.record.new_record? ?
		# render status: :not_found
		# 	     json: {
		# 		    error: t(exception)
    #        }        
  end                          
end
