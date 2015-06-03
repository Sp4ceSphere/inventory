class EquipmentItemsController < ApplicationController
  before_action :set_equipment_item, only: [:show, :edit, :update, :destroy]

  ### If the user is unauthenticated, send em packin
  before_filter :authenticate_user!
  
  # GET /equipment_items
  # GET /equipment_items.json
  def index
    #Only return the current user's items
    @equipment_items = EquipmentItem.where(user_id: current_user.id)
  end

  # GET /equipment_items/1
  # GET /equipment_items/1.json
  def show
  
    ### If it's the wrong user, send em packin
    @item = EquipmentItem.find(params[:id])
    if @item.user_id != current_user.id
		redirect_to action: "index"
    end
  end

  # GET /equipment_items/new
  def new
    @equipment_item = EquipmentItem.new
  end

  # GET /equipment_items/1/edit
  def edit
    ### If it's the wrong user, send em packin
    @item = EquipmentItem.find(params[:id])
    if @item.user_id != current_user.id
		redirect_to action: "index"
    end
  end

  # POST /equipment_items
  # POST /equipment_items.json
  def create
    @equipment_item = EquipmentItem.new(equipment_item_params)
 
    #Set the user id of the equipment item to the current user
    @equipment_item.user_id = current_user.id
    
    respond_to do |format|
      if @equipment_item.save
        format.html { redirect_to @equipment_item, notice: 'Equipment item was successfully created.' }
        format.json { render :show, status: :created, location: @equipment_item }
      else
        format.html { render :new }
        format.json { render json: @equipment_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipment_items/1
  # PATCH/PUT /equipment_items/1.json
  def update
  
    ### If it's the wrong user, send em packin
    @item = EquipmentItem.find(params[:id])
    if @item.user_id != current_user.id
		redirect_to action: "index"
    else
		
		
		respond_to do |format|
		  if @equipment_item.update(equipment_item_params)
			format.html { redirect_to @equipment_item, notice: 'Equipment item was successfully updated.' }
			format.json { render :show, status: :ok, location: @equipment_item }
		  else
			format.html { render :edit }
			format.json { render json: @equipment_item.errors, status: :unprocessable_entity }
		  end
		end
    end
  end

  # DELETE /equipment_items/1
  # DELETE /equipment_items/1.json
  def destroy
  
    ### If it's the wrong user, send em packin
    @item = EquipmentItem.find(params[:id])
    
    if @item.user_id != current_user.id
		redirect_to action: "index"
    else
		@equipment_item.destroy
		respond_to do |format|
		  format.html { redirect_to equipment_items_url, notice: 'Equipment item was successfully destroyed.' }
		  format.json { head :no_content }
		end
	end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipment_item
      @equipment_item = EquipmentItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equipment_item_params
      params.require(:equipment_item).permit(:name, :serial, :purchase_date, :comments, :equipment_type_id, :user_id)
    end
    
end
