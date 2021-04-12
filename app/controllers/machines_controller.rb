class MachinesController < ApplicationController
  def index
    if params[:owner_id]
      @owner = Owner.find(params[:owner_id])
      @machines = @owner.machines
    else
      @machines = Machine.all
    end
  end
  # <h1><%= @owner.name %> Vending Machines</h1>
  #
  # <% @owner.machines.each do |machine| %>

  def show
    @machine = Machine.find(params[:id])
    @snacks = @machine.snacks #.all
    @average_price = @machine.average_price
  end
end
