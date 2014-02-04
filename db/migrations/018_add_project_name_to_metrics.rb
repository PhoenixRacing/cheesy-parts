Sequel.migration do
	change do
		alter_table(:metrics) do
			add_column :project_name, String, :null => false
		end
	end
end