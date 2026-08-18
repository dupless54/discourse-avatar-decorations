# name: discourse-avatar-decorations
# about: Discord tarzı profil çerçeveleri ve dekorasyonları sistemi
# version: 1.0.0
# authors: ErespawN & AI Dev Team
# url: https://github.com/kullanici_adin/discourse-avatar-decorations

enabled_site_setting :avatar_decorations_enabled

register_asset "stylesheets/decorations.scss"

after_initialize do
  # Sitedeki tüm avatarları render eden Ember.js widget'ına sızıyoruz
  register_asset "javascripts/discourse/initializers/avatar-frames.js", :client_side
end