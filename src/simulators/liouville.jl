# compute the liuoville equation and propagate a state psi forward in time
function evolve(problem, x)
    # a problem definition will contain drift_ham, n*control_ham and a duration
    # in theory these are the only things that we need, except the pulse
    # the pulse can be passed as either another parameter and then we just do an array lookup
    # or we could write a pulse type that will store all the data
    



end

function 