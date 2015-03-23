class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  
  def index
  
    # Manera para identificar la página principal del sitio web. Lo uso para SEO.
    @principal_page = true


  end

end
