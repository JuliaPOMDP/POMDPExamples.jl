using NBInclude
using Test

projdir = joinpath(dirname(@__FILE__()), "..")

@testset "notebooks" begin
    for d in readdir(joinpath(projdir, "notebooks"))
        if endswith(d, ".ipynb")
            path = joinpath(projdir, "notebooks", d)
            @info("Running "*path)
            stuff = "using NBInclude; @nbinclude(raw\"" * path * "\")"
            cmd = `julia --project=$projdir -e $stuff`
            proc = run(pipeline(cmd, stderr=stderr), wait=false)
            @test success(proc)
        end
    end
end
