class AddInstrumentHistoryAndPracticeTimeToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :history, :string
    add_column :users, :practice, :integer
  end
end
