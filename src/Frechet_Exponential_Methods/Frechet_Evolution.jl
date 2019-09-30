
module Frechet_Evolution

export Frechet_Time_Evolution

"""
See Roberts Code: green/simulaton.py -->
class SimpleEvolution(TimeEvolutionPC) (lines 115 - 156)

"""

push!(LOAD_PATH, pwd())
push!(LOAD_PATH, joinpath(pwd(), "Frechet_Exponential_Methods"))
using Frechet_Exponential


struct Frechet_Time_Evolution
    hamiltonian_drift
    hamiltonians
    time_steps
    tau
    number_ti :: Int
    number_pc :: Int
    number_controls :: Int
    evolution_hamiltonians
    gradients

    function Frechet_Time_Evolution(hamiltonian_drift=nothing,
                                    hamiltonians_ti=nothing,
                                    hamiltonians_pc=nothing,
                                    time_steps::Int64=100,
                                    tau::Real=1)
        @assert(hamiltonian_drift != nothing, "No drift Hamiltonian given!")
        number_ti = 0
        number_pc = 0
        hamiltonians = []
        if hamiltonians_ti != nothing
            number_ti = length(hamiltonians_ti)
            for x in hamiltonians_ti
                push!(hamiltonians, x)
            end
        end
        if hamiltonians_pc != nothing
            number_pc = length(hamiltonians_pc)
            for x in hamiltonians_pc
                push!(hamiltonians, x)
            end
        end
        number_controls = number_ti + number_pc
        evolution_hamiltonians = []
        gradients = []
        new(hamiltonian_drift, hamiltonians, time_steps, tau, number_ti,
            number_pc, number_controls, evolution_hamiltonians, gradients)
    end

end

# function



















end
