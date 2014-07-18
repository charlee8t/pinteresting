class FlowsController < ApplicationController
  before_action :set_flow, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [ :edit, :update, :destroy]
  before_action :authenticate_user!, except:[:index, :show]

  
  def index
    @flows = Flow.all
  end

  
  def show
  end

  
  def new
    @flow = current_user.flows.build
  end

  
  def edit
  end

  
  def create
    @flow = current_user.flows.build(flow_params)
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

    def correct_user

      @flow = current_user.flows.find_by(id: params[:id])
      redirect_to flows_path, notice: "Not authorize to edit this pin"  if @flow.nil?

    end




    # Never trust parameters from the scary internet, only allow the white list through.
    def flow_params
      params.require(:flow).permit(:description, :image)
    end
end
