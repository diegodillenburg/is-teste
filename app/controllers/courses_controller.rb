class CoursesController < ApplicationController
  responders :flash

  def index
    @courses = Course.all
    respond_with @course
  end

  def show
    @course = Course.find_by(id: params[:id])
    respond_with @course
  end

  def new
    @course = Course.new
    respond_with @course
  end

  def create
    @course = Course.create(course_params)

    respond_with @course, location: @course
  end

  def edit
    @course = Course.find_by(id: params[:id])
    respond_with @course
  end

  def update
    @course = Course.find_by(id: params[:id])
    @course.update_attributes(course_params)
    respond_with @course, location: @course
  end

  def destroy
    @course = Course.find_by(id: params[:id])
    @course.destroy

    respond_with(nil, location: courses_path)
  end

  private

  def course_params
    params.require(:course).permit([:name, :description, :status])
  end
end
