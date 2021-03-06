class EmployeesController < ApplicationController
	#  before_filter :authenticate_admin!
	def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
    render "_form"
  end

  def edit
    @employee = Employee.find(params[:id])
    render "_form"
  end
  
  def show
    @employee = Employee.find(params[:id])
    @shifts = @employee.shifts
    @merchant = @employee.merchant
  end

  def create
    @employee = Employee.new(params[:employee])
    # @employee.payrate = (@employee.payrate/100)
    if @employee.save
      redirect_to employees_url, notice: "Сотрудник создан."
    else
      redirect_to employees_url, warning: "Something wrong" 
    end
  end

  def update
    if params[:employee][:password].blank?
      params[:employee].delete(:password)
      params[:employee].delete(:password_confirmation)
    end
    @employee = Employee.find(params[:id])
    @employee.update_attributes(params[:employee])
    @employee.merchant.update(params[:merchant]) if params[:merchant].present?
    if @employee.save
      redirect_to employees_url, notice: "Сотрудник обновлен." if current_employee.admin?
      redirect_to sites_url unless current_employee.admin?
    else
      redirect_to employees_url, warning: "Something wrong" 
    end
  end
  
  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to employees_url, notice: "Сотрудник удален."
  end
  
end
