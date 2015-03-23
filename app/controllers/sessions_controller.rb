class SessionsController < ApplicationController
  include SessionsHelper

  def new

  end

  def index
    if signed_in?
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js {  }
      end     
    else

      @session = Session.new;

      respond_to do |format|
        format.html { render }
        format.js {  }
      end    
    end
  end
  
  # Crea la sesion
  def create
    # Busca al usuario por nombre o nick

    if (user = User.find_by(nick: params[:nick].downcase))

      # Comprueba la contraseña para ese usuario
      check_pass = user.check_password(params[:pass])


      if user.blank? or !check_pass
        respond_to do |format|
          format.html { redirect_to login_path }
          format.js {  }
        end
      else
        
        iniciar_sesion(user)
        self.current_user= user;

        respond_to do |format|
          format.html { redirect_to root_path }
          format.js {  }
        end
      end
    
    else
      redirect_to login_path
    end
  end

  # Elimina la sesión
  def destroy
    if signed_in?
      sign_out
    end

    redirect_to root_url
  end

end
