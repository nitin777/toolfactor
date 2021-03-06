class ToolFactorsController < ApplicationController
  helper_method :sort_column, :sort_direction

  # fetch all records
  def index
	unless params[:id].nil?
		session[:tool_id] = params[:id].to_i
	end
@o_all = ToolFactor.search(session[:tool_id]).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])

  end
  
  #fetch single record and display
  def show
    @o_single = ToolFactor.find(params[:id])
  end
  
  # generate a form for new record
  def new
    @o_single = ToolFactor.new
  end
  
  #create a new record and save in database
  def create
    @o_single = ToolFactor.new(params[:tool_factor])
    if @o_single.save
      flash[:notice] = t("general.successfully_created")
      redirect_to tool_factors_path
    else
      render :action => 'new'
    end
  end
  
  # generate a edit form to update the record
  def edit
    @o_single = ToolFactor.find(params[:id])
	
  end
  
  # update a record and save in database
  def update
    @o_single = ToolFactor.find(params[:id])
    if @o_single.update_attributes(params[:tool_factor])
      flash[:notice] = t("general.successfully_updated")
      redirect_to tool_factors_path
    else
      render :action => 'edit'
    end
  end
  
  #destoy a record
  def destroy
    @o_single = ToolFactor.find(params[:id])
    @o_single.destroy
    flash[:notice] = t("general.successfully_destroyed")
    redirect_to tool_factors_url
  end
  def list_area_by_city
	@o_area = Area.where(:city_id => params[:id])
  end
  private
  
  # sort column private method
  def sort_column
    ToolFactor.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  # order records private method
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
end
