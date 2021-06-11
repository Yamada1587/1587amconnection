class LessonsController < ApplicationController
   before_action :authenticate_user!

 def index
    @lessons = Lesson.all
    if params[:search] != nil && params[:search] != ''
      #部分検索かつ複数検索
      search = params[:search]
      @lessons = Lesson.joins(:user).where("lesson_name LIKE ? OR teacher_name LIKE ? OR academic_year LIKE ? OR quarter LIKE ? OR day7 LIKE ? OR period LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      @lessons = Lesson.all
    end
 end

 def like_user 
   @lesson = Lesson.find(params[:id])
 end

 def new
    @lesson = Lesson.new
 end

 def create
    lesson = Lesson.new(lesson_params)
    lesson.user_id = current_user.id
    if lesson.save
        redirect_to :action => "index"
    else
        redirect_to :action =>"new"
    end
 end

 def show
    @lesson = Lesson.find(params[:id])
    @comments = @lesson.comments
    @comment = Comment.new
    @e_lesson = Lesson.find_by(id: params[:id])
    @user = User.find_by(id: @e_lesson.user_id)
 end   

 def edit
    @lesson = Lesson.find(params[:id])
 end

 def update
    lesson = Lesson.find(params[:id])
    if lesson.update(lesson_params)
      redirect_to :action => "show", :id => lesson.id
    else
      redirect_to :action => "new"
    end
 end

 def destroy
    lesson = Lesson.find(params[:id])
    lesson.destroy
    redirect_to action: :index
 end

 private
  def lesson_params
    params.require(:lesson).permit(:lesson_name, :teacher_name, :academic_year, :quarter, :day7, :period)
  end
end