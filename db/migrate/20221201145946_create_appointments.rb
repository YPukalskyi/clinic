class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.datetime :started_at
      t.datetime :ended_at

      t.string :status, default: 'active'
      t.text :recommendation

      t.belongs_to :user
      t.belongs_to :doctor
      t.timestamps
    end
  end
end
