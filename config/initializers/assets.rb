# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( stylesStep1.css )
Rails.application.config.assets.precompile += %w( stylesStep2.css )
Rails.application.config.assets.precompile += %w( stylesStep3.css )
Rails.application.config.assets.precompile += %w( stylesStep3_failed.css )
Rails.application.config.assets.precompile += %w( additional/popupStyle.css )
Rails.application.config.assets.precompile += %w( additional/phonemodel.css )
Rails.application.config.assets.precompile += %w( popup_window.js )
Rails.application.config.assets.precompile += %w( validation.js )
Rails.application.config.assets.precompile += %w( sweet-alert.min.js )
Rails.application.config.assets.precompile += %w( jquery.maskedinput-1.3.js )
Rails.application.config.assets.precompile += %w( jquery-3.1.1.js )
Rails.application.config.assets.precompile += %w( phone_input_model.js )
Rails.application.config.assets.precompile += %w( steps/WiFi_3.png )
Rails.application.config.assets.precompile += %w( steps/step1_pc.css )
Rails.application.config.assets.precompile += %w( steps/step1_tablet.css )
Rails.application.config.assets.precompile += %w( steps/step1_mobile.css )
Rails.application.config.assets.precompile += %w( fontTruthCYR.css )
Rails.application.config.assets.precompile += %w( sweet-alert.css )

#enginnering
Rails.application.config.assets.precompile += %w( style_engineering_room.css )

#admin
Rails.application.config.assets.precompile += %w( style_admin_room.css )

#subscriber
Rails.application.config.assets.precompile += %w( subscriber/first_start_page.css )

Rails.application.config.assets.precompile += %w( style.css )
Rails.application.config.assets.precompile += %w( jquery.maskedinput-1.3.1.min.js )
Rails.application.config.assets.precompile += %w( script.js )
Rails.application.config.assets.precompile += %w( is.mobile.js )
Rails.application.config.assets.precompile += %w( jquery.maskedinput-1.4.1.js )

Rails.application.config.assets.precompile += %w( platform.js )
