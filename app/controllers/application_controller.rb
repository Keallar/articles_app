class ApplicationController < ActionController::Base
  # helper_method :retrive_last_index_page_or_default

  def hello
    render html: 'Hello World!' 
  end

  # def store_last_index_page
  #   session[:last_index_page] = request.fullpath
  # end

  # def retrive_last_index_page_or_default(default_path: root_path)
  #   session[:last_index_page] || default_path
  # end
end
