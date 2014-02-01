## sgearray.jl.  Iterators for use in conjunction with Sun Grid Engine
## (c) 2014 David A. van Leeuwen
##

issge() = haskey(ENV, "SGE_TASK_ID") && haskey(ENV, "SGE_TASK_LAST")

Base.start(sge::SGEArray) = sge.start
Base.done(sge::SGEArray, state::Int) = state > length(sge.array) 
Base.next(sge::SGEArray, state::Int) = sge.array[state], state+sge.step
Base.length(sge::SGEArray) = div(length(sge.array)-sge.start, sge.step)+1

SGEArray(r::Range1) = SGEArray([r])
