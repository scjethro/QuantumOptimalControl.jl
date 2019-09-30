"""
This is for testing the Frechet Matrix Exponential
"""

using LinearAlgebra
# I do not understand woh to conveniently import modules from another file
push!(LOAD_PATH, pwd())
push!(LOAD_PATH, joinpath(pwd(), "Frechet_Exponential_Methods"))
using Frechet_Exponential

A_real = [1 2 3; 0 4 6; 0 0 2]
B_real = [1 0 0; 0 1 0; 0 0 1]

A_c = complex(rand(3, 3))
B_c = complex(rand(3, 3))

println("\n"^1)
println(expm_frechet(A_real, B_real))
println("\n"^1)
println(expm_frechet(A_c, B_c))
println("\n"^1)
