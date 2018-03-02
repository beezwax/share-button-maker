require "share_button_maker/version"
require "share_button_maker/config"
require "share_button_maker/helper"

I18n.load_path += Dir.glob( File.dirname(__FILE__) + "lib/locales/*.{rb,yml}" ) 

module ShareButtonMaker
  module Rails
    if ::Rails.version < "3.1"
      require "share_button_maker/railtie"
    else
      require "share_button_maker/engine"
    end
  end
end

ActiveSupport.on_load(:action_view) do
  include ShareButtonMaker::Helper
end
