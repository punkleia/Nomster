class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
 
  def create
    @place = Place.find(params[:place_id])
    @place.comments.create(comment_params.merge(user: current_user))
    redirect_to place_path(@place)
  end

  def new
    @comment = Comment.new
  end

  def show
    @place = Place.find(params[:place_id])
    @comment = Comment.new
  end

#  def edit
 #   @comment = Comment.find(params[:id])
  #  @post = Post.find(param[:post_id])

   #   if @comment.user != current_user
   #     return render text: "Not Allowed", status: :forbidden
    #  end
#  end

#  def update
#    @comment = Comment.find(params[:id])
#    @place.comments.update_attributes(comment_params)
#    redirect_to place_path(@place)
#  end

#  def destroy
 #  @place = Place.find(params[:place_id])
  #  @place.comments.destroy(params[:id])
    

   # if @comment.user != current_user
    #  return render text: "Not Allowed", status: :forbidden
    #end

     # @comment.destroy
      #redirect_to root_path
  #end

  private

  def comment_params
    params.require(:comment).permit(:message, :rating)
  end

end
