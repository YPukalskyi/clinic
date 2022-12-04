%w[Surgeon Ophthalmologist Therapist Cardiologist].each do |category|
  FactoryBot.create(:category, name: category)
end
