class ApplicationController < ActionController::Base
  #deveise_controllerというdeviceのヘルパーメソッドを指定
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  #deviceコントローラーを編集できないため、共通コントローラーに記載
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
