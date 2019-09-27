max_si = 5
max_iter = 10
n_pulses = 2
max_freq = 18.0
dt = 0.01

freq_list = rand(max_si, n_pulses) * max_freq
# this is a list of frequencies initially
# of the form
# si1 freq_pulse1 | si1 freq_pulse2 | si1 freq_pulse3
# si2 freq_pulse1 | si2 freq_pulse2 | si2 freq_pulse3
# si3 freq_pulse1 | si3 freq_pulse2 | si3 freq_pulse3

# for each frequency you need two coefficients, a and b
coefficient_list = []
for i in range(1, length(freq_list) * 2, step = n_pulses)
    append!(coefficient_list, [(rand(), rand())])
end

coefficient_list = reshape(coefficient_list, (max_si, n_pulses))
# this is a list of coefficients of the form
# pulse 1 | pulse 2 | pulse 3
# si1 (A, B) | (A, B) | (A, B)

for i in range(1, [1 2], step = n_pulses)
    println(i)
end

# println(coefficient_list)
exit()

# for i in range(1, stop = max_si)
#     # for each super iteration we go in, take the frequency and take the coefficients
#
#     # select the appropriate frequencies and coefficients
#     f_list = freq_list[1:i, :]
#     c_list = coefficient_list[1:i, :]
#
#     function fn_to_opt(x)
#         # here x is a flat list of coefficients
#         # we reshape it
#         c_list = []
#         for i in range(1, x, step = n_pulses)
#             append!(c_list, [(x[i], x[i+1])])
#         end
#
#         # storage for each pulse
#         z = zeros(Int(floor(problem.duration/dt)), n_pulses)
#         # loop over each pulse
#         for ii in range(1, stop = n_pulses)
#             f_list_pulse = f_list[:, ii]
#             c_list_pulse = c_list[:,ii]
#
#             # since we know the length of this we should use an MArray and preallocate the memory
#             pulse = []
#             # evaluate the fourier series for each pulse
#             for t in range(0.0, stop = problem.duration, step = dt)
#                 append!(pulse, fourier_series(f_list_pulse, c_list_pulse, t))
#             end
#             z[:, ii] = pulse
#         end
