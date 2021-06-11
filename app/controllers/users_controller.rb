class UsersController < ApplicationController
    def index
    end

    def following_users
      @user = User.find(params[:id])
    end

    def followed_users
      @user = User.find(params[:id])
    end

    def lesson_list
      @user = User.find(params[:id])
      @lesson_list = Lesson.where(user_id: params[:id])
    end

    def like_list
      @user = User.find(params[:id])
    end
    
    def show
      @lessons = Lesson.all
      @user = User.find(params[:id])
      @like_list = Like.where(user_id: params[:id]) 
      @lesson_list = Lesson.where(user_id: params[:id])
      @image = User.find(params[:id]).image
      @currentUserEntry=Entry.where(user_id: current_user.id)
      @userEntry=Entry.where(user_id: @user.id)
      if @user.id == current_user.id
      else
        @currentUserEntry.each do |cu|
          @userEntry.each do |u|
            if cu.room_id == u.room_id then
              @isRoom = true
              @roomId = cu.room_id
            end
          end
        end
        if @isRoom
        else
          @room = Room.new
          @entry = Entry.new
        end
      end
    end

    def create
      @user = User.new(user_params)
      #デフォルトで画像を設定しておく。ユーザーのimageカラムにデータを代入
      @user.image = "default_icon.jpg"
       if @user.save
         redirect_to posts_path, success: '登録ができました'
       else
         flash.now[:danger] = "登録に失敗しました"
         render :new
       end
     end

    def destroy
      @user = User.find(params[:id]) #特定のidを持つ情報を取得
      @user.destroy
      flash[:success] = 'ユーザーを削除しました。'
      redirect_to :root
    end

    def followings
        @followings = @user.following_users
        redirect_back(fallback_location: root_path)
    end
    
    def followers
        @followers = @user.follower_users
        redirect_back(fallback_location: root_path)
    end
    
    
   private
   def user_params
    params.require(:user).permit(:name, :email, :image, :profile, :user_grade) 
   end
end
