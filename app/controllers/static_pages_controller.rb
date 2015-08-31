class StaticPagesController < ApplicationController  
  def admin
  end
  
  def attributions
  end
  
  def ask_the_question_guide
  end

  def home
    @videos = Statement.approved
  end

  def upload_video
  end

end