class Patient::AppointmentsController < ApplicationController
  before_action :patient_appointments, only: %i[edit update]

  def index
    @appointments = current_user.appointments
  end

  def new
    @appointment = Appointment.new
  end

  def edit
  end

  def create
    @appointment = current_user.appointments.create(appointment_params)

    if @appointment.save
      redirect_to patient_appointments_path
    else
      render :new
    end
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to patient_appointments_path
    else
      render :edit
    end
  end

  private

  def patient_appointments
    @appointment = current_user.appointments.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:started_at, :ended_at, :doctor_id)
  end
end
