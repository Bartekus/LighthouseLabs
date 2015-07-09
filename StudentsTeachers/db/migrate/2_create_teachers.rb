class CreateTeachers < ActiveRecord::Migration
  
  def change
    # Add code to create the table here
    # HINT: check out ActiveRecord::Migration.create_table
    create_table :teachers do |t|
      # column definitions go here
      # Use the AR migration guide for syntax reference
      t.column      :name,      :string
      t.column      :email,     :string
      t.column      :address,   :string
      t.column      :phone,     :string
      t.timestamps  null:       true
    end
  end

end
