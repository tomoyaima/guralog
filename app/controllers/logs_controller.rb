class LogsController < ApplicationController
# before_action :authenticate_user!,only:[:new,:index,:create,:edit,:destroy]
  def index


      @like = Like.new
      @searchinfos = Searchinfo.new
      @searchinfos = Searchinfo.all
      @prefectures = Prefecture.all
if params[:change] == "rank"


        #@like = Like.find(params[:id])
        if params[:log] == nil
          @logs = Like.group(:log_id).order('count(log_id) desc').pluck(:log_id)
          @logs = @logs.map{|n| Log.find(n)}

        elsif params[:log] == ""
          @logs = Like.group(:log_id).order('count(log_id) desc').pluck(:log_id)
          @logs = @logs.map{|n| Log.find(n)}
        else
          #部分検索
          @logs = Like.group(:log_id).order('count(log_id) desc').pluck(:log_id)
          @logs = @logs.map{|n| Log.find(n)}
          @logs = Log.where("school LIKE ? ",'%' + params[:log] + '%')

         end
else
     if params[:log] == nil
       @logs = Log.all.order("id DESC")

     elsif params[:log] == ""
       @logs = Log.all.order("id DESC")
     else
       #部分検索
       @logs = Log.where("school LIKE ? ",'%' + params[:log] + '%')

      end
  end
  end




  def mypage
  @logs = Log.all.order("id DESC")
  @like = Like.new

  end

  def show
   @log = Log.find(params[:id])
   @like = Like.new
  end

  def edit
      @log = Log.find(params[:id])
    end



  def new
    @log = Log.new
    @prefectures = Prefecture.all
  end


  def create
    @log = Log.new(log_params)
    @log.user_id = current_user.id

    #新しいTweetの保存に成功した場合
    if @log.save


      #index.html.erbにページが移る

      redirect_to action: "index"

    #新しいTweetの保存に失敗した場合

    else
      #もう一回投稿画面へ
      redirect_to action: "new"
    end
  end

  def destroy

    Log.find(params[:id]).destroy

    redirect_to action: :mypage
  end

  def update
     @log = Log.find(params[:id])
     @log.user_id = current_user.id

     if @log.update(log_params)
       redirect_to :action => "mypage"
     else
       redirect_to :action => "edit"
     end
   end

  private
  #セキュリティのため、許可した:bodyというデータだけ取ってくるようにする
  def log_params
    params.require(:log).permit(:body,:title,:score,:book,:name,:department,:major,:job,:school)
  end

end
