class AppointmentsController < ApplicationController
  before_action :get_appointment, only: [:edit, :show, :update, :destroy]

  def index
    @appointments = Appointment.all
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      redirect_to new_appointment_path
    end
  end

  def new
    @appointment = Appointment.new
  end

  def update
    @appointment.update(appointment_params)

    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      redirect_to edit_appointment_path
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path
  end

  def show

  end

  def edit

  end

  private

  def get_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:appointment_datetime, :patient, :doctor)
  end

  end
