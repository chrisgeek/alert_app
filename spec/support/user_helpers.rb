require 'faker'
require 'factory_bot_rails'

module UserHelpers

  def create_user
    create(:user)
  end

  def build_user
    build(:user)
  end

end
