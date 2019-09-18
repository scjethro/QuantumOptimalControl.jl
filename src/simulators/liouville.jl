module liouville

using ..ClosedProblem
using ..Pulse
using DifferentialEquations
using LinearAlgebra

# compute the liuoville equation and propagate a state psi forward in time
function evolve(problem::ClosedProblem, pulse::Pulse)
    # a problem definition will contain drift_ham, n*control_ham and a duration
    # in theory these are the only things that we need, except the pulse
    # the pulse can be passed as either another parameter and then we just do an array lookup
    # or we could write a pulse type that will store all the data
    
    # should be changed to take a list of pulses that is as long as the list of control hams
    # do pairing that Thomas suggested [H0, [[H_ctrl, P1], [H_ctrl, P2]]]

    tspan = (0.0, problem.duration)
    u0 = I(2) + 0.0im * I(2)
    # has to be more elegant way to do this right?
    # named parameter tuple with the problem and the pulse
    par = (d_H = problem.drift_ham, d_ctrl = problem.control_ham, pul = pulse)
    prob = ODEProblem(computeunitary!, u0, tspan, par)
    sol = solve(prob, abstol = 1e-6, reltol = 1e-6, save_everystep=false, alg = Tsit5())

    return sol.u[end] * problem.initial_state

end

function computeunitary!(du, u, p, t)
    # unpack the amplitude and phase of the pulse
    (amp, ph) = p.pul(t)
    # compute the full Hamiltonian
    # THIS NEEDS TO BE ADJUSTED FOR THOMAS METHOD!!
    full_Ham = p.d_H + p.d_ctrl[1] * amp * cos(ph) + p.d_ctrl[1] * amp * sin(ph) 
    mul!(du, -1.0im * p, u)
end

end