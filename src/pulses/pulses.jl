module pulses 

export Pulse, OptimalPulse

abstract type Pulse end

struct OptimalPulse{T<:AbstractFloat} <: Pulse
    # at some point convert these to static arrays
	amplitude::Array{T,1}
	phase::Array{T,1} 
    duration::T

    # constructor for the optimal pulse
    function OptimalPulse(amp, ph, duration::T) where T <: AbstractFloat
        new{T}(amp, ph, duration)
	end

end

# 31ns median when benchmarking
function _amp_ph_t(c::Pulse, t::AbstractFloat)::Tuple{AbstractFloat, AbstractFloat}
    # since we know the duration of the pulse and we know the time then we just compute the index
    ii = Int(floor(t/c.duration * length(c.amplitude)))
    # catch all cases    
    if ii == 0
        ii = 1
    elseif ii > length(c.amplitude)
        # might think about returning 0 here, but not sure
        ii = length(c.amplitude)
    end

    return (c.amplitude[ii], c.phase[ii])
end

# there's not a huge point in this function but it'll look nicer in code
# there's 100% a nicer way to do this where you pass the field as an argument
# but I can't think of it right now
# at the moment this works because the array is mutable, if we start using StaticArrays
# then we might have to rethink this
function _set_pulse_amplitude(c::Pulse, a::Array{AbstractFloat, 1})
        resize!(c.amplitude, length(a))
        c.amplitude[:] = a
end

function _set_pulse_phase(c::Pulse, a::Array{AbstractFloat, 1})
    resize!(c.phase, length(a))
    c.phase[:] = a
end

(c::OptimalPulse)(b::AbstractFloat) = _amp_ph_t(c, b)


end
