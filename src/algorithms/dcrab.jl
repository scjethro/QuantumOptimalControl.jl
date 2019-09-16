module dcrab

function dCRAB(problem)
    # we need a set of default parameters which can be stored that should work

    max_si = 5
    max_iter = 10
    n_pulses = 2

    function fn_to_opt(x)

        fn_list = []
        for p = 1:n_pulses
            a_vals = x[1:2:end][p:2:end]
            b_vals = x[2:2:end][p:2:end]
            ab = hcat(a_vals, b_vals)        
            append!(fn_list, [prep_fns(ab, freq_list[p:2:end])])
        end

        # now we have function list, 1st function is amplitude
        
        # now we need to simulate the problem, ideally this should be done with some common interface 
        



end