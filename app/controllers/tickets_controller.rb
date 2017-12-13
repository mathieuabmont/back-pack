class TicketsController < ApplicationController
  def show
    @transport = Transport.find(params[:transport_id])
    @ticket = Ticket.find(params[:id])
    authorize @ticket
  end

  def new
   @transport = Transport.find(params[:transport_id])
   @ticket = Ticket.new(transport: @transport)
   authorize @ticket
  end

  def create
    @transport = Transport.find(params[:transport_id])
    @ticket = Ticket.new(ticket_params)
    @ticket.transport = @transport
    authorize @ticket
    @ticket.user = current_user

    if @ticket.save
      redirect_to transport_ticket_path(@transport, @ticket)
    else
      render :new
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
    authorize @ticket
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    authorize @ticket
    @ticket.destroy
  end


  private

  def ticket_params
    params.require(:ticket).permit(:photo)
  end
end
