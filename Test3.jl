using Pkg
Pkg.activate(".");
Pkg.instantiate();

using ModelingToolkit
using PlotlyJS
using WorldDynamics

#wenn ich diesen code einfüge funktioniert worlddynamics nicht mehr
#Pkg.add("CSV")
#Pkg.add("DataFrames")
#using CSV
#using DataFrames

include("src/Earth4All.jl");

#change initial parameters
#define initial population parameters
pop_mod_pars = Earth4All.Population.getparameters();

#set DNCM (minimum desired number of children)
pop_mod_pars[:DNCM] = 1.2;

#run model with custom parameters
e4a_sol = Earth4All.run_e4a_solution(;pop_pars=pop_mod_pars);


#difine population sector
@named pop = Earth4All.Population.population();

#define climate sector
#@named brt = Earth4All.Population.birthr();

#safe variables to plot
reference_variables = [(pop.POP, 4000, 10000, "POP"), (pop.BIRTHS, 0,200,"Births per year"), (pop.DEATHS, 0,200,"Deaths per year")];

print(reference_variables)

print(pop.POP) #gibt nicht die werte aus


#define t
#@variables t;

#plot variables
#plotvariables(e4a_sol, (t, 1980, 2100), reference_variables, showlegend=true, colored=true)

#display the type of pop_values to understand its data type
#println("Type of pop_values: ", typeof(pop.POP))

#print the actual values
#println("Population values: ", pop.POP)




#save values in excel
# Extract data from the solution
#t_values = e4a_sol.t
#pop_values = e4a_sol(pop.POP)
#births_values = e4a_sol(pop.BIRTHS)
#deaths_values = e4a_sol(pop.DEATHS)

# Create a DataFrame
#df = DataFrame(
#    Time = t_values,
#    Population = pop_values,
#    Births = births_values,
#    Deaths = deaths_values
#)

# Save DataFrame to Excel file
#CSV.write("population_data.csv", df)