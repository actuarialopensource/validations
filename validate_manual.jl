using CSV
using MortalityTables

select_filepath = joinpath(@__DIR__, "validate_sel.csv")
select_csv = CSV.File(select_filepath)

# test the select values
for row in select_csv
    table_id, age, dur, val = row
    # load the table
    local table = MortalityTables.table(table_id)
    if !(table.select[age][age + dur - 1] == val)
        error("The values don't match")
    end
end

ultimate_filepath = joinpath(@__DIR__, "validate_ult.csv")
ultimate_csv = CSV.File(ultimate_filepath)

for row in ultimate_csv
    table_id, age, val = row
    # load the table
    local table = MortalityTables.table(table_id)
    if !(table.ultimate[age] == val)
        error("The values don't match")
    end
end