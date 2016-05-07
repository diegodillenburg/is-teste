class ClassroomsController < ApplicationController
  responders :flash

  def index
    @classrooms = Classroom.all
    respond_with @classroom
  end

  def show
    @classroom = Classroom.find_by(id: params[:id])
    respond_with @classroom
  end

  def new
    @classroom = Classroom.new
    respond_with @classroom
  end

  def create
    @classroom = Classroom.create(classroom_params)

    respond_with @classroom, location: @classroom
  end

  def edit
    @classroom = Classroom.find_by(id: params[:id])
    respond_with @classroom
  end

  def update
    @classroom = Classroom.find_by(id: params[:id])
    @classroom.update_attributes(classroom_params)
    respond_with @classroom, location: @classroom
  end

  def destroy
    @classroom = Classroom.find_by(id: params[:id])
    @classroom.destroy

    respond_with(nil, location: classrooms_path)
  end

  private

  def classroom_params
    params.require(:classroom).permit([:student_id, :course_id])
  end
end
