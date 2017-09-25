class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.valid?
      @author.save
      redirect_to author_path(@author)
      return
    end
    render :new
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    @author.update
    @author.valid? ? (redirect_to author_path(@author)) : (render :edit)
  end



  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end
end
