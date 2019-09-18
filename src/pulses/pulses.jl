module Pulses 

export Pulse, OptimalPulse

abstract type Pulse end

struct OptimalPulse{T<:AbstractFloat} <: Pulse
    # at some point convert these to static arrays
	amplitude::Array{T,1}
	phase::Array{T,1} 
    duration::T

    # constructor for the optimal pulse
    function OptimalPulse(amp::Array{T,1}, ph::Array{T,1}, duration::T) where T <: AbstractFloat
        new{T}(amp, ph, duration)
	end

end

function _amp_ph_t(c::Pulse, t::AbstractFloat)::Tuple{AbstractFloat, AbstractFloat}
    # since we know the duration of the pulse and we know the time then we just compute the index
    ii = Int(t/c.duration * length(c.amplitude))
    # catch all cases    
    if ii == 0
        ii = 1
    elseif ii > length(c.amplitude)
        ii = length(c.amplitude)
    end

    return (c.amplitude[ii], c.phase[ii])
end

(c::OptimalPulse)(b::AbstractFloat) = _amp_ph_t(c, b)


end
