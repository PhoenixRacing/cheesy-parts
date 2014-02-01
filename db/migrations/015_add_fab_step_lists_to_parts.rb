Sequel.migration do
	change do
		alter_table(:parts) do
			add_column :fabsteps_remaining, String, :default => '', :null => false
			add_column :fabsteps_completed, String, :default => '', :null => false
		end
	end
end