class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params)

    respond_with @student, location: students_path
  end

  private

  def student_params
    params.require(:student).permit([:name, :register_number, :status])
  end
end
