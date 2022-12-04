class UserPresenter < BasePresenter
  def full_name
    "#{@record.first_name} #{@record.last_name}"
  end
end
