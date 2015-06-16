class TicketsController < ApplicationController
  before_action :find_ticket, only: [:update]

  def new
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      flash[:notice] = "Yay your ticket was saved!"
      redirect_to board_path(@ticket.board)
    else
      flash[:alert] = "Ticket could not be saved"
      render :new
    end
  end

  def update
    @ticket.update(ticket_params)
    redirect_to :back
  end

  private

  def ticket_params
    params.require(:ticket).permit(:title, :description, :status, :board_id)
  end

  def find_ticket
    @ticket = Ticket.find_by(id: params[:id])
  end
end
