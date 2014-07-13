class CreateFlows < ActiveRecord::Migration
  def change
    create_table :flows do |t|
      t.string :description

      t.timestamps
    end
  end
end
