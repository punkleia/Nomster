class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
 
  def create
    #@comment = Comment.find(params[:id])
    @place = Place.find(params[:place_id])

    @comment = Comment.new
    #@place.comments.create(comment_params.merge(user: current_user))
    #redirect_to place_path(@place)
    @place.comments.create(comment_params.merge(user: current_user))
    redirect_to place_path(@place)
  end

  def new
    @comment = Comment.new
  end

  def show
    @comment = Comment.find(params[:id])
    @place = Place.find(params[:place_id])
    @comment = Comment.new
    @user = User.find(params[:user_id])
  end

 def edit
  #@place = Place.find(params[:place_id])
  @comment = Comment.find(params[:id])
      if @comment.user != current_user
         return render text: "Not Allowed", status: :forbidden
      end
 end

 def update
  @comment = Comment.find(params[:id])
    if @comment.user != current_user
      return render text: "Not Allowed", status: :forbidden
    end

  @comment.update_attributes(comment_params)
    if @comment.valid?
      redirect_to current_user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
      if @comment.user != current_user
        return render text: "Not Allowed", status: :forbidden
      end
    @comment.destroy
    redirect_to current_user
  end
    

  # if @comments.user != current_user
  #  return render text: "Not Allowed", status: :forbidden
  # end
  #   @place.comments.destroy
  #   redirect_to root_path
 # end

  private

  def comment_params
    params.require(:comment).permit(:message, :rating)
  end

end
