using Pkg
Pkg.activate(".");

Pkg.instantiate();


include("src/Earth4All.jl");

using ModelingToolkit

using WorldDynamics




sol1 = Earth4All.run_tltl_solution();

pop_mod_pars = Earth4All.Population.getparameters();
pop_mod_pars[:DNCM] = 2.2;
sol2 = Earth4All.run_e4a_solution(;pop_pars=pop_mod_pars);

@named pop = Earth4All.Population.population();

Earth4All.plot_two_sols("TLTL", sol1, "DNCMIN=2.2", sol2, pop, "Population Mp", 1980, 2100, 7681)

