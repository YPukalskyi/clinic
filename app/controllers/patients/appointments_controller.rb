class Patients::AppointmentsController < ApplicationController
  before_action :appointment, only: %i[edit update]

  def index
    @appointments = current_user.appointments
  end

  def new
    @appointment = Appointment.new(doctor_id: params[:doctor_id])
  end

  def edit; end

  def create
    @appointment = current_user.appointments.create(appointment_params)

    if @appointment.save
      redirect_to patients_appointments_path
    else
      render :new
    end
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to patients_appointments_path
    else
      render :edit
    end
  end

  private

  def appointment
    @appointment = current_user.appointments.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:started_at, :ended_at, :doctor_id)
  end
end
