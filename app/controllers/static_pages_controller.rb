class StaticPagesController < ApplicationController
  def home
  end

  def prehome
  	@is_mobile = mobile_device?
  	@preuser = Preuser.new
  end

  def about
  end
end
