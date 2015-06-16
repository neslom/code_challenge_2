class BoardsController < ApplicationController
  def index

  end

  def new
  end

  def create
    @board = Board.new(board_params)

    if @board.save
      flash[:notice] = "Board created!"
      redirect_to @board
    else
      flash[:alert] = "Something went wrong"
      render :new
    end
  end

  def show
    @board = Board.find_by(id: params[:id])
  end

  private

  def board_params
    params.require(:board).permit(:title)
  end
end
