Sequel.migration do
	change do
		create_table(:metrics) do
			primary_key :id
			Integer :project_id, :null => false
			Integer :part_id, :null => false
			String :part_number, :null => false
			String :part_name, :null => false
			Integer :user_id, :null => false
			String :user_lastname, :null => false
			String :user_firstname, :null => false
			String :action, :null => false
			Timestamp :time
		end
	end
end
