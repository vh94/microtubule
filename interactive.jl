# Interactive Model

params = Dict(
    :p_hyd => 0:0.01:1,
    :p_polym => 0:0.01:1,
    :p_depolym_GTP => 0:0.01:1,
    :p_depolym_GDP =>0:0.01:1
)
GLMakie.activate!()
groupcolor(a) = a.polym >= 1 ? :red : :blue ; groupmarker(a) = a.GDP == true ? :circle : :octagon
mdata=[mean_MT_size,sd_MT_size]; mlabels=["mean MT length", "sd"]
adata = [(:GDP,sum)]; alabels = ["Hydrolized"]

fig, adf, mdf = abm_data_exploration(
    model, agent_step!, model_step!, params;
    ac=groupcolor, am=groupmarker, adata,alabels,mdata,mlabels
)