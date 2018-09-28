using NBInclude
using Test

@testset "notebooks" begin
    projdir = joinpath(dirname(@__FILE__()), "..")
    for d in readdir(joinpath(projdir, "notebooks"))
        if endswith(d, ".ipynb")
            path = joinpath(projdir, "notebooks", d)
            @info("Running "*path)
            stuff = "using NBInclude; @nbinclude(\"" * path * "\")"
            cmd = `julia --project=$projdir -e $stuff`
            proc = run(pipeline(cmd, stderr=stderr), wait=false)
            @test success(proc)
        end
    end
end
