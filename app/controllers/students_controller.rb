class StudentsController < ApplicationController
  responders :flash

  def index
    @students = Student.all
    respond_with @student
  end

  def show
    @student = Student.find_by(id: params[:id])
    respond_with @student
  end

  def new
    @student = Student.new
    respond_with @student
  end

  def create
    @student = Student.create(student_params)

    respond_with @student, location: @student
  end

  def edit
    @student = Student.find_by(id: params[:id])
    respond_with @student
  end

  def update
    @student = Student.find_by(id: params[:id])
    @student.update_attributes(student_params)
    respond_with @student, location: @student
  end

  def destroy
    @student = Student.find_by(id: params[:id])
    @student.destroy

    respond_with(nil, location: students_path)
  end

  private

  def student_params
    params.require(:student).permit([:name, :register_number, :status])
  end
end
