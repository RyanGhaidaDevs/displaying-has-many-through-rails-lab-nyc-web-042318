class PatientsController < ApplicationController
    before_action :get_patient, only: [:edit, :show, :update, :destroy]

    def index
      @patients = Patient.all
    end

    def create
      @patient = Patient.new(patient_params)
      if @patient.save
        redirect_to patient_path(@patient)
      else
        redirect_to new_patient_path
      end
    end

    def new
      @patient = Patient.new
    end

    def update
      @patient.update(patient_params)

      if @patient.save
        redirect_to patient_path(@patient)
      else
        redirect_to edit_patient_path
      end
    end

    def destroy
      @patient.destroy
      redirect_to patient_path
    end

    def show

    end

    def edit

    end

    private

    def get_patient
      @patient = Patient.find(params[:id])
    end

    def patient_params
      params.require(:patient).permit(:name, :age)
    end

  end
