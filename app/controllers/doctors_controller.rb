class DoctorsController < ApplicationController

  before_action :get_doctor, only: [:edit, :show, :update, :destroy]

  def index
    @doctors = Doctor.all
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to doctor_path(@doctor)
    else
      redirect_to new_doctor_path
    end
  end

  def new
    @doctor = Doctor.new
  end

  def update
    @doctor.update(doctor_params)

    if @doctor.save
      redirect_to doctor_path(@doctor)
    else
      redirect_to edit_doctor_path
    end
  end

  def destroy
    @doctor.destroy
    redirect_to doctors_path
  end

  def show
    @appointments = Appointment.find(params[:id])
  end

  def edit

  end

  private

  def get_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:name, :department)
  end

end
