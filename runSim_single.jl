include("initModel.jl")
adata = [:pos, :polym, :GDP]
data, _ = run!(model,agent_step!, model_step!,600;adata)
print("Model Data created")