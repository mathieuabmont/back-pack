class TicketsController < ApplicationController
  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
   @transport = Transport.find(params[:transport_id])
   @ticket = Ticket.new
  end

  def create
    @transport = Transport.find(params[:transport_id])
    @ticket = ticket.new(ticket_params)
    @ticket.transport = @transport
    # @ticket.user = current_user
    # authorize @ticket
    if @ticket.save
      redirect_to transport_ticket_path(@transport_ticket)
    else
      render :new
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
  end


  private

  def ticket_params
    params require(:ticket).permit(:photo)
  end
end
