class User < ActiveRecord::Base

  before_create :assign_rank
  has_many :posts

  # Método para asignar permisos
  # 0: Default
  # 1: Admin
  def assign_rank(options={})
    if options.blank?
      self.rank = 0
    end
  end

  def admin?
    self.rank == 0
  end

  # Genera un Token de base 64
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  # Cifra usando SHA2 el token
  def User.encrypt(token)
    Digest::SHA2.hexdigest(token.to_s)
  end

  # Recibe una contraseña y comprueba si es esa contraseña
  def check_password(password_to_check)
    return (self.password == User.encrypt("--#{password_to_check}--#{self.created_at}--#{self.password_salt}"))
  end

  # Genera un Token único por sesión al usuario
  def generate_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end

  # Creacion de contraseña: Genera una contraseña para el usuario
  #   - Prepara una salt para el usuario
  #   - Encriptación de contraseña (contraseña, created_at, salt)
  def generate_password
    self.password_salt = User.encrypt("--#{Time.now.utc}--#{ENV['SALT']}")
    self.password = User.encrypt("--#{self.password}--#{self.created_at}--#{self.password_salt}")
    self.save
  end

  private

end
