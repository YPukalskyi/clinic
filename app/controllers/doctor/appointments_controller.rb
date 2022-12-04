class Doctor::AppointmentsController < ApplicationController
  before_action :doctor_appointment, only: %i[edit update]

  def index
    @appointments = current_user.doctor.appointments
  end

  def edit
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to doctor_appointments_path
    else
      render :edit
    end
  end

  private

  def doctor_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.required(:appointment).permit(:recommendation, :status)
  end
end
