class CreateResponsibles < ActiveRecord::Migration[5.2]
  def change
    create_table :responsibles do |t|
      t.belongs_to :user, index: true
      t.belongs_to :service, index: true

      t.timestamps
    end
  end
end
