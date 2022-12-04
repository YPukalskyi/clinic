class DoctorPresenter < BasePresenter
  def full_name
    @record.user&.presenter&.full_name
  end
end
