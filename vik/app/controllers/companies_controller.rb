class CompaniesController < ApplicationController

  # before_action :authenticate_user, {only: [:detail, :edit_top, :edit_bottom, :update, :update_bottom, :update_img]}
  # before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}

  before_action :ensure_correct_company, {only: [:edit_top, :edit_bottom, :update, :update_bottom, :update_img]}

  def redirect
  end

  def select
    @companies = Company.all
  end

  def detail
    @companies = Company.find_by(id: params[:id])
    @likes = Like.where(post_id: @companies.id)
    # if session[:companies_id] == nil
    #   @error_message = "ログインが必要です"
    #   render("login_form")
    # end
  end

  def new
    @companies = Company.new
    if session[:companies_id] != nil
      flash[:notice] = "すでにログインしています"
      redirect_to ("/companies/redirect")
    end
  end

  def create
    if session[:companies_id] != nil
      flash[:notice] = "すでにログインしています"
      redirect_to ("/companies/redirect")
    end
    @companies = Company.new(
        c_name: params[:c_name],
        c_email: params[:c_email],
        c_password: params[:c_password],
        c_url: params[:c_url],
        c_tel: params[:c_tel],
        c_content: params[:c_content],
        c_industry: params[:c_industry],
        c_place: params[:c_place],
        image: "default_user.png",
    )
    if @companies.save
      session[:companies_id] = @companies.id
      session[:companies_name] = @companies.c_name

      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/companies/my_page/#{@companies.id}")
    else
      render("companies/new")
    end
  end

  def login_form
    if session[:companies_id] != nil
      flash[:notice] = "すでにログインしています"
      redirect_to ("/companies/redirect")
    end
  end
  def login
    if session[:companies_id] != nil
      flash[:notice] = "すでにログインしています"
      redirect_to ("/companies/redirect")
    end
    @companies = Company.find_by(c_email: params[:c_email], c_password: params[:c_password])
    if @companies
      session[:companies_id] = @companies.id
      session[:companies_name] = @companies.c_name

      flash[:notice] = "ログインしました"
      redirect_to("/companies/my_page/#{@companies.id}")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:c_email]
      @password = params[:c_password]

      render("login_form")
    end
  end
  def logout
    session[:companies_id] = nil
    session[:companies_name] = nil
    # flash[:notice] = "ログアウトしました"
    redirect_to("/companies/login_form")
  end

  def update
    if session[:companies_id] == nil
      @error_message = "ログインが必要です"
      render("login_form")
    end
    @companies = Company.find_by(id: params[:id])
    @companies.c_name = params[:c_name]
    @companies.c_email = params[:c_email]
    @companies.c_password = params[:c_password]
    @companies.c_tel = params[:c_tel]
    @companies.c_industry = params[:c_industry]
    @companies.c_place = params[:c_place]
    @companies.save

    if @companies.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/companies/my_page/#{@companies.id}")
    else
      render("companies/my_page/#{@companies.id}")
    end
  end

  def edit_top
    if session[:companies_id] == nil
      @error_message = "ログインが必要です"
      render("login_form")
    end
    @companies = Company.find_by(id: params[:id])
  end
  def edit_bottom
    if session[:companies_id] == nil
      @error_message = "ログインが必要です"
      render("login_form")
    end
    @companies = Company.find_by(id: params[:id])
  end

  def update_bottom
    if session[:companies_id] == nil
      @error_message = "ログインが必要です"
      render("login_form")
    end
    @companies = Company.find_by(id: params[:id])
    @companies.c_url = params[:c_url]
    @companies.c_content = params[:c_content]
    @companies.save
    if @companies.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/companies/my_page/#{@companies.id}")
    else
      render("companies/my_page/#{@companies.id}")
    end
  end
  def update_img
    if session[:companies_id] == nil
      @error_message = "ログインが必要です"
      render("login_form")
    end
    @companies = Company.find_by(id: params[:id])
    # 画像のアップロード用
    if params[:image]
      @companies.image = "#{@companies.id}.jpg"
      image = params[:image]
      File.binwrite("public/company_images/#{@companies.image}",image.read)
    end
    if @companies.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/companies/my_page/#{@companies.id}")
    else
      render("companies/my_page/#{@companies.id}")
    end
  end

  def ensure_correct_company
    if @current_company.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/companies/redirect")
    end
  end

end
