class CommentsController < ApplicationController

  def create
    if comment.save
      flash[:notice] = 'Comment was added!'
      redirect_to movie_path(movie)
    else
      flash[:error] = 'You already added your comment!'
      redirect_to movie_path(movie)
    end

  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to movie_path(movie)
    flash[:notice] = 'Comment was removed!'
  end

  private


  def comment
    Comments::CreateService.new(params: comment_params, user: current_user, movie: movie).call
  end

  def movie
    Movie.find(params[:movie_id])
  end

  def comment_params
    params.require(:comment).permit(:signature, :content)
  end

end