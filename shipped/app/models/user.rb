class User < ActiveRecord::Base
  has_many :boats


  attr_accessor :password
    validates_confirmation_of :password
    validates :username, uniqueness: true
    before_save :encrypt_password


    def encrypt_password
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end

    def self.authenticate(username, password)
      user = User.where(username: username).first
        if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
          return user
        else
          nil
        end
    end

end
