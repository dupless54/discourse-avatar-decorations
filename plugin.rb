# name: discourse-cosmetics
# about: Avatar dekorasyonları, isim plakaları ve kullanıcı kartı çerçeveleri.
# version: 1.0.0
# authors: ErespawN & AI Dev Team

enabled_site_setting :cosmetics_enabled

after_initialize do
  # 1. VERİTABANI ALANLARINI OLUŞTUR
  User.register_custom_field_type('avatar_frame', :string)
  User.register_custom_field_type('nameplate', :string)
  User.register_custom_field_type('user_card_decoration', :string)
  
  register_editable_user_custom_field(:avatar_frame)
  register_editable_user_custom_field(:nameplate)
  register_editable_user_custom_field(:user_card_decoration)

  allow_public_user_custom_field(:avatar_frame)
  allow_public_user_custom_field(:nameplate)
  allow_public_user_custom_field(:user_card_decoration)

  # 2. VERİLERİ FORUMUN ÖN YÜZÜNE (API) GÖNDER
  # Kullanıcı Kartı ve Profil için:
  add_to_serializer(:user, :avatar_frame) { object.custom_fields['avatar_frame'] }
  add_to_serializer(:user, :nameplate) { object.custom_fields['nameplate'] }
  add_to_serializer(:user, :user_card_decoration) { object.custom_fields['user_card_decoration'] }

  add_to_serializer(:user_card, :avatar_frame) { object.custom_fields['avatar_frame'] }
  add_to_serializer(:user_card, :nameplate) { object.custom_fields['nameplate'] }
  add_to_serializer(:user_card, :user_card_decoration) { object.custom_fields['user_card_decoration'] }

  # Gönderilerdeki (Konu içi) kullanım için:
  add_to_serializer(:post, :user_avatar_frame, false) { object.user&.custom_fields&.[]('avatar_frame') }
  add_to_serializer(:post, :user_nameplate, false) { object.user&.custom_fields&.[]('nameplate') }
end