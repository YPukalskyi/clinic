FactoryBot.create(:doctor, user: FactoryBot.create(:user, phone_number: '093123451', password: '111111'), categories: [Category.first])

10.times do
  FactoryBot.create(:doctor, categories: [Category.all.sample])
end
