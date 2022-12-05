class AppointmentPresenter < BasePresenter
  def status
    Appointments::Statuses::STATUSES_HUMANIZED.fetch(@record.status, @record.status)
  end

  def period
    "#{@record.started_at.strftime('%Y.%m.%d %H:%M')} - #{@record.ended_at.strftime('%Y.%m.%d %H:%M')}"
  end
end
