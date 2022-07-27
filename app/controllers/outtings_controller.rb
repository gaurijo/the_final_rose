class OuttingsController < ApplicationController 
   def show
      @outting = Outting.find(params[:id])
   end
end