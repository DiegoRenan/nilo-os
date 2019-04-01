class AddCompanyToServices < ActiveRecord::Migration[5.2]
  def change
    add_reference :services, :company, foreign_key: true
  end
end
