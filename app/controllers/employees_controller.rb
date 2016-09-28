class EmployeesController < ApplicationController
  def index
    @employees = Unirest.get("localhost:3000/api/v1/employees.json").body
  end

  def new
  end

  def create
    @employee = Unirest.post("localhost:3000/api/v1/employees.json",
                             headers: {"Accept" => "application/json"},
                             parameters: {
                               first_name: params[:first_name],
                               last_name: params[:last_name],
                               email: params[:email],
                               ssn: params[:ssn]
                             }).body

    redirect_to "/employees/#{params['id']}"
  end

  def show
    @employee = Unirest.get("localhost:3000/api/v1/employees/#{params[:id]}").body
  end
end
