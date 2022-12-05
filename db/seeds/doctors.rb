FactoryBot.create(:doctor, user: FactoryBot.create(:user, phone_number: '093123451'), categories: [Category.first])

10.times do
  FactoryBot.create(:doctor, categories: [Category.all.sample])
end
