module cl_sys_problems
# module containing descriptions of cloesd system problems 

export ClosedProblem, ClosedStateTransfer

using ..pulses
# thinking about using StaticArrays to store some of the fixed size arrays
#using StaticArrays

abstract type Problem end

abstract type ClosedProblem <: Problem end



# this will define a closed state transfer type problem
# here we know that 
struct ClosedStateTransfer <: ClosedProblem
    # everywhere you have a matrix just now you can also have a function that returns a matrix
    # this allows you to think about doing optimisation over an ensemble of systems.

    # store for the Drift Hamiltonian, can either be a 2D Complex array or a function
    drift_ham::Union{AbstractArray{Complex,2},Function}
    # store for the Conrtol Hamiltonian, can either be a list of Hamiltonians or some functions
    # since we're not going for a general solver here but something specific to pulse sequences 
    # at the moment we don't need to take care of the case where the user supplies some coefficients
    # to the controls, since the coefficients will be taken from the pulse directly 
    control_hams::Union{AbstractArray{AbstractArray{Complex,2},1},Function}
    # want to store the states as density matrices for convenience, is there a reason to store psi?
    initial_state::AbstractArray{Complex,2}
    final_state::AbstractArray{Complex,2}
    # each problem can have either one or a list of optimal pulses associated with it, 
    # we can then update the amplitude and phases of these as we go?
    optimal_pulse::AbstractArray{OptimalPulse,1}

    function ClosedStateTransfer(dh, ch, is, fs)
        op = OptimalPulse([], [], 0.0) # just a generic optimal pulse with no initial values
        new(dh, ch, is, fs, op)
    end
end

end