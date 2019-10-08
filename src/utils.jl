# utility functions

# might want to store the Pauli matrices here
# also want a function to expand the control matrices properly

# might want to specify types here
function commutator(a, b)
    a * b - b * a
end

# function to plot a pulse
function plot()