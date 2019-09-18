module cl_sys_problems
# module containing descriptions of cloesd system problems 

export ClosedProblem, ClosedStateTransfer

abstract type ClosedProblem end



# this will define a closed state transfer type problem
# here we know that 
struct ClosedStateTransfer <: ClosedProblem
    drift_ham
    control_ham
    initial_state
    final_state
    optimal_pulse # each problem can have either one or a list of optimal pulses associated with it, 
    # we can then update the amplitude and phases of these as we go?

    function ClosedStateTransfer(dh, ch, is, fs)
        new(dh, ch, is, fs)
    end
end

end