class User < ApplicationRecord
    has_many :worlds
    has_many :characters, through :worlds
    has_many :items, through :characters

    validates_presence_of :name
    has_secure_password


    def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            user.provider = auth.provider
            user.uid = auth.uid
            user.name = auth.info.name
            user.password = SecureRandom.hex
          end
        end

end