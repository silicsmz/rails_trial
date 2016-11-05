class SocialProfile < ApplicationRecord
  #devise :omniauthable, :omniauth_providers: [:twitter]

  ##引数に関連するユーザーが存在すればそれを返し、存在しなければ新規に作成する
  #def self.find_or_create_from_auth_hash(auth_hash)
  #  provider = auth_hash[:provider]
  #  uid = auth_hash[:uid]
  #  nickname = auth_hash[:info][:nickname]
  #  image_url = auth_hash[:info][:image]

  #  SocialProfile.find_or_create_by(provider: provider, uid: uid) do |social_profile|
  #    social_profile.nickname = nickname
  #    social_profile.image_url = image_url
  #  end
  #end
end
