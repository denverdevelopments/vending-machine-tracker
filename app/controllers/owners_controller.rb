class OwnersController < ApplicationController
  def index
    @owners = Owner.all
    #@machines = @owner.machines  #.all
  end
end
