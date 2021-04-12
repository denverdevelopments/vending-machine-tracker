class SnacksController < ApplicationController
  def index
    @snacks = Snack.all
  end

  def show
    @snack = Snack.find(params[:id])
    @machines = @snack.machines
  end
# <h3>Average Machine Snack Price  <%= @machine.average_price %></h3>
end
