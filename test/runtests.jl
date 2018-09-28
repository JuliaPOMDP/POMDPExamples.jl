using POMDPExamples
using Test
using NBInclude

# Test that all the notebooks run
notebooks_path = joinpath(dirname(pathof(POMDPExamples)), "notebooks")

@testset "explicit interface" begin 
    @nbinclude(joinpath(notebooks_path, "Defining-a-POMDP-with-the-Explicit-Interface.ipynb"))
end