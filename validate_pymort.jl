using CSV
using MortalityTables

# load the table
table = MortalityTables.table(3277)


select_filepath = joinpath(@__DIR__, "3277_sel.csv")
select_csv = CSV.File(select_filepath)
# test the select values
for row in select_csv
    age, dur, val = row
    if !(table.select[age][age + dur - 1] == val)
        error("The values don't match")
    end
end

ultimate_filepath = joinpath(@__DIR__, "3277_ult.csv")
ultimate_csv = CSV.File(ultimate_filepath)
for row in ultimate_csv
    age, val = row
    if !(table.ultimate[age] == val)
        error("The values don't match")
    end
end

