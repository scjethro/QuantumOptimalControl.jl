push!(LOAD_PATH, pwd())
push!(LOAD_PATH, joinpath(pwd(), "Frechet_Exponential_Methods"))
using Frechet_Evolution

H_d = [1 0; 0 1]
H_ti = nothing
H_pc = nothing
time_steps = 20
tau = 0.1

muh = Frechet_Time_Evolution(H_d)
