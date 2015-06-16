class TicketsController < ApplicationController
  def new
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      flash[:notice] = "Yay your ticket was saved!"
      redirect_to @ticket.board
    else
      flash[:alert] = "Ticket could not be saved"
      render :new
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:title, :description, :status)
  end
end
