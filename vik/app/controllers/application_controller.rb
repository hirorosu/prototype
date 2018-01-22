class ApplicationController < ActionController::Base
  # protect_from_forgeryはリクエストを検証して正しければ何もしない、正しくない場合はsessionをクリアする。
  # protect_from_forgery with: :exception



  before_action :set_current_company
  before_action :set_current_student

  def set_current_company
    @current_company  = Company.find_by(id: session[:companies_id])
  end

  def set_current_student
    @current_student  = Student.find_by(id: session[:students_id])
  end

  # def authenticate_user
  #   if @companies == nil
  #     @error_message = "ログインが必要です"
  #     redirect_to("/companies/login_form")
  #   end
  # end
  #
  # def forbid_login_user
  #   if @companies == nil
  #     flash[:notice] = "すでにログインしています"
  #     redirect_to("/companies/my_page/#{@companies.id}")
  #   end
  # end

end
