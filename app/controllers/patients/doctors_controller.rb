class Patients::DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
  end
end
