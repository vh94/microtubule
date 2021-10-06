# initialization

include("Model.jl")

model = initialize(
    griddims =(50,50),
    periodic= true,
    Nstarts=1,
    numagents = 120,
    p_polym=0.80,
    p_hyd= 0.02,
    p_depolym_GTP=0,
    p_depolym_GDP=0.03)
