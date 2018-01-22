class StudentsController < ApplicationController

  before_action :ensure_correct_student, {only: [:edit_top, :update, :update_img, :update_pdf]}

  def redirect
  end

  def select
    @students = Student.all
  end

  def detail
    @students = Student.find_by(id: params[:id])
    @likes = Like.where(user_id: @students.id)
    # if session[:students_id] == nil
    #   @error_message = "ログインが必要です"
    #   render("students/login_form")
    # end
  end

  def new
    @students = Student.new
    if session[:students_id] != nil
      flash[:notice] = "すでにログインしています"
      redirect_to ("/students/redirect")
    end
  end

  def create
    if session[:students_id] != nil
      flash[:notice] = "すでにログインしています"
      redirect_to ("/students/redirect")
    end
    @students = Student.new(
        s_name: params[:s_name],
        s_email: params[:s_email],
        s_password: params[:s_password],
        s_school: params[:s_school],
        s_grade: params[:s_grade],
        image: "default_user.png",
        )
    if @students.save
      session[:students_id] = @students.id
      session[:students_name] = @students.s_name

      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/students/my_page/#{@students.id}")
    else
      render("students/new")
    end
  end

  def login_form
    if session[:students_id] != nil
      flash[:notice] = "すでにログインしています"
      redirect_to ("/students/redirect")
    end
  end

  def login
    if session[:students_id] != nil
      flash[:notice] = "すでにログインしています"
      redirect_to ("/students/redirect")
    end
    @students = Student.find_by(s_email: params[:s_email], s_password: params[:s_password])
    if @students
      session[:students_id] = @students.id
      session[:students_name] = @students.s_name

      flash[:notice] = "ログインしました"
      redirect_to("/students/my_page/#{@students.id}")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:s_email]
      @password = params[:s_password]

      render("students/login_form")
    end
  end

  def logout
    session[:students_id] = nil
    session[:students_name] = nil
    # flash[:notice] = "ログアウトしました"
    redirect_to("/students/login_form")
  end

  def update
    if session[:students_id] == nil
      @error_message = "ログインが必要です"
      render("students/login_form")
    end
    @students = Student.find_by(id: params[:id])
    @students.s_name = params[:s_name]
    @students.s_email = params[:s_email]
    @students.s_password = params[:s_password]
    @students.s_school = params[:s_school]
    @students.s_grade = params[:s_grade]
    @students.save

    if @students.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/students/my_page/#{@students.id}")
    else
      render("students/my_page/#{@students.id}")
    end
  end

  def edit_top
    if session[:students_id] == nil
      @error_message = "ログインが必要です"
      render("students/login_form")
    end
    @students = Student.find_by(id: params[:id])
  end

  def update_img
    if session[:students_id] == nil
      @error_message = "ログインが必要です"
      render("students/login_form")
    end
    @students = Student.find_by(id: params[:id])
    # 画像のアップロード用
    if params[:image]
      @students.image = "#{@students.id}.jpg"
      image = params[:image]
      File.binwrite("public/student_images/#{@students.image}",image.read)
    end
    if @students.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/students/my_page/#{@students.id}")
    else
      render("students/my_page/#{@students.id}")
    end
  end

  def update_pdf
    if session[:students_id] == nil
      @error_message = "ログインが必要です"
      render("students/login_form")
    end
    @students = Student.find_by(id: params[:id])
    # 画像のアップロード用
    if params[:pdf]
      @students.pdf = "#{@students.id}.pdf"
      pdf = params[:pdf]
      File.binwrite("public/student_pdf/#{@students.pdf}",pdf.read)
    end
    if @students.save
      flash[:notice] = "PDFファイルをアップロードしました"
      redirect_to("/students/my_page/#{@students.id}")
    else
      render("students/my_page/#{@students.id}")
    end
  end

  def show
    @students = Student.find_by(id: params[:id])
    # if session[:students_id] == nil
    #   @error_message = "ログインが必要です"
    #   render("students/login_form")
    # end
  end
  def update_s_live_id
    if session[:students_id] == nil
      @error_message = "ログインが必要です"
      render("students/login_form")
    end
    @students = Student.find_by(id: params[:id])
    @students.s_live_id = params[:s_live_id]
    @students.save
    if @students.save
      flash[:notice] = "企業に配信を公開しました"
      redirect_to("/students/my_page/#{@students.id}/show/#{@students.id}")
    else
      render("students/my_page/#{@students.id}")
    end
  end

  # def likes
  #   @students = Student.find_by(id: params[:id])
  #   @likes = Like.where(post_id: @students.id)
  #   redirect_to("/students/my_page/#{@students.id}")
  # end

  def ensure_correct_student
    if @current_student.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/students/redirect")
    end
  end
end
