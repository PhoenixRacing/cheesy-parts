Sequel.migration do
	change do
		alter_table(:parts) do
			set_column_type :part_number, String
		end
	end
end
