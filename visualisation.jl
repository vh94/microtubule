#Video out:

include("initModel.jl")
#include("agent.jl")
#include("modelstep.jl")
using InteractiveDynamics
#using CairoMakie

using GLMakie

# coloring
groupcolor(a) = a.polym == true ? :red : :blue
groupmarker(a) = a.GDP == true ? :circle : '○'

#GLMakie.activate!()

abm_video(
    "video/Microtubule_periodic_15starts.mp4", model, agent_step!,model_step!;
    ac = groupcolor, am = groupmarker,
    framerate = 20, frames = 500,
    title = ("Microtubule Simulation 
    periodic= true,
    Nstarts=10,
    numagents = 1250,
    p_polym=0.80,
    p_hyd= 0.03,
    p_depolym_GTP=0,
    p_depolym_GDP=0.02"))
