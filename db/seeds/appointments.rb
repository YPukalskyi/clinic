10.times do |index|
  FactoryBot.create(
    :appointment,
    started_at: DateTime.now + index.day,
    ended_at: DateTime.now + index.day + 1.hour,
    user: User.find(3),
    doctor: Doctor.first
  )
end
