class Summary < ActiveRecord::Base
  
  belongs_to :post

  def user
    post.user
  end

end
