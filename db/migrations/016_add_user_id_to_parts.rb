Sequel.migration do
	change do
		alter_table(:parts) do
			add_column :user_id, Integer
		end
	end
end
