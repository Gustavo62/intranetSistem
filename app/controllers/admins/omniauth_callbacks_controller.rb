# frozen_string_literal: true

class Admins::OmniauthCallbacksController < Devise::OmniauthCallbacksController 
  def twitter
  end 
  def passthru
    super 
  end 
  def failure
    super
  end
  protected 
  def after_omniauth_failure_path_for(scope)
    super(scope)
  end
end
