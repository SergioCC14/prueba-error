class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper
  
  def index
    # Manera para identificar la página principal del sitio web. Lo uso para SEO.
    @principal_page = true
    select_nav

  end

 def contact
    select_nav
  end

 def about
    select_nav
  end

  # GET /motherbase
  # Panel de control
  def motherbase
    if (signed_in?) and (current_user.admin?)
    
      respond_to do |format|
        format.html { render }
        format.js { render}
      end

    else
      redirect_to login_path
    end
  end


  def select_nav
    @active_nav = case params[:action]
      when 'about' then 'about'
      when 'contact' then 'contact'
    else nil
    end

  end

end
