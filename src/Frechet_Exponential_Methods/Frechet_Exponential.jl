# need to install PyCall and Conda
# using Pkg
# 	Pkg.add("PyCall")
# 	Pkg.add("Conda")
#
# then install scipy in Conda env
# 	using Conda
# 	Conda.add("scipy")

# using PyCall
# scipy_linalg = pyimport("scipy.linalg")

### Example ###

# # define two random matices
# A = rand(5, 5)
# B = rand(5, 5)
#
# # calculate the matrixexponential and the derivative of the expm in the
# # direciton of B
#
# exponential, frechet_derivative = scipy_linalg.expm_frechet(A, B)
#
# println(exponential)
# println(frechet_derivative)

##############################################################################
##############################################################################
##############################################################################

module Frechet_Exponential

export expm_frechet

using PyCall

"""
expm_frechet(A, B, compute_expm=true)

Parameters:
	A: (N, N) matrix
		Matrix of which to take the matrix exponential.
	B: (N, N) matrix
		Matrix direction in which to take the Frechet derivative.
	For compute_expm=false only the Frechet derivative is returned

Returns:
	expm_A:	(N, N) matrix
		Matrixexponential of A.
	expm_frechet_AB: (N, N) matrix
		Frechet derivative of the matrix exponential of A in the direction B.
"""
function expm_frechet(A::Array, B::Array; compute_expm::Bool=true)
	scipy_linalg = pyimport("scipy.linalg")
	return scipy_linalg.expm_frechet(A, B, compute_expm=compute_expm)
end

### I have no idea how we can check if inputs are 2D arrays with numbers
###	that are real or complex

# function expm_frechet(A :: Array{Any, 2},
# 				      B :: Array{Any, 2};
# 					  compute_expm=true)
# 	scipy_linalg = pyimport("scipy.linalg")
# 	return scipy_linalg.expm_frechet(A, B, compute_expm=compute_expm)
# end

# function expm_frechet(A :: AbstractArray,
# 				      B :: AbstractArray;
# 					  compute_expm::Bool=true)
# 	return scipy_linalg.expm_frechet(A, B, compute_expm=compute_expm)
# end

# function expm_frechet(A :: Array{T, 2},
# 				      B :: Array;
# 					  compute_expm=true) where T <: Union{Float64, Complex{Float64}}
# 	scipy_linalg = pyimport("scipy.linalg")
# 	return scipy_linalg.expm_frechet(A, B, compute_expm=compute_expm)
# end

end

##############################################################################
##############################################################################
##############################################################################
