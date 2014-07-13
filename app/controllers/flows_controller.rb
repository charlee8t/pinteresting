class FlowsController < ApplicationController
  before_action :set_flow, only: [:show, :edit, :update, :destroy]

  
  def index
    @flows = Flow.all
  end

  
  def show
  end

  
  def new
    @flow = Flow.new
  end

  
  def edit
  end

  
  def create
    @flow = Flow.new(flow_params)
    if @flow.save
      redirect_to @flow, notice: 'Flow was successfully created.' 
          else
      render :new 
    end
  end

 
  def update
    if @flow.update(flow_params)
      redirect_to @flow, notice: 'Flow was successfully updated.'   
    else
      render :edit   
    end
  end

  
  def destroy
    @flow.destroy
    redirect_to flows_url, notice: 'Flow was successfully destroyed.'    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flow
      @flow = Flow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flow_params
      params.require(:flow).permit(:description)
    end
end
