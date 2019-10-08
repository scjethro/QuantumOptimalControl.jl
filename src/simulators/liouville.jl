module liouville

using ..ClosedProblem
using ..Pulse
using DifferentialEquations
using LinearAlgebra

# compute the liuoville equation and propagate a state forward in time
# using an ODE solver to solve this problem
function evolve(problem::ClosedProblem)
    tspan = (0.0, problem.duration)
    u0 = Array
    
    # should be changed to take a list of pulses that is as long as the list of control hams
    # do pairing that Thomas suggested [H0, [[H_ctrl, P1], [H_ctrl, P2]]]

    tspan = (0.0, problem.duration)
    # this holds for the case where we don't have a function for the drift Ham
    # for now we assume that we begin with the identity matrix
    u0 = Matrix{eltype(problem.drift_ham)}(I, problem.dimension, problem.dimension)
    # named parameter tuple with the problem and the pulse
    par = (d_H = problem.drift_ham, d_ctrl = problem.control_ham, pul = pulse)
    # has to be more elegant way to do this right?
    prob = ODEProblem(computeunitary!, u0, tspan, par)
    sol = solve(prob, abstol = 1e-6, reltol = 1e-6, save_everystep = false, alg = Tsit5())
    return sol.u[end] * problem.initial_state
end

function computeunitary!(du, u, p, t)
    # unpack the amplitude and phase of the pulse
    (amp, ph) = p.pul(t)
    # compute the full Hamiltonian
    # THIS NEEDS TO BE ADJUSTED FOR THOMAS METHOD!!
    full_Ham = p.d_H + p.d_ctrl[1] * amp * cos(ph) + p.d_ctrl[2] * amp * sin(ph) 
    mul!(du, -1.0im * p, u)
end

function discrete_propagator(problem, t)
    (amp, ph) = problem.optimal_pulse(t)
    exp(-1.0im * problem.step_size * problem.drift_ham + problem.control_ham[1] * amp * cos(ph) + problem.control_ham[2] * amp * sin(ph))
end
# discrete time evolution, no ODE solver, return the state at each time step. 
function discrete_evolve(problem)
    # knowing the time step we create an array to store the state at each slice, assuming that we will always need
    # an array of 2D arrays, in theory we could make this static?
    sol = AbstractArray{AbstractArray{Complex,2},1}
    N = Int(floor(problem.duration / problem.step_size))

    for dt in range(0.0, problem.duration, step = problem.step_size)

    end

end

end