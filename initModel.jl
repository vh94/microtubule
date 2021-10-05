# initialization
include("MSD.jl")
include("Model.jl")
include("agent.jl")
include("agentstep.jl")
include("modelstep.jl")

model = initialize(
    griddims =(200,200),
    periodic= true,
    Nstarts=15,
    numagents = 1250,
    p_polym=0.80,
    p_hyd= 0.02,
    p_depolym_GTP=0,
    p_depolym_GDP=0.03)
