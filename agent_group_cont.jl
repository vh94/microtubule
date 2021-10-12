# Functions to calculate mean MT lenght MT (group) definend by 
#  countmap(data.polym) 
using Statistics
# allgemeiner fall
function agent_group_cont(model,group,fun::Int64)
    groupv = Vector{Int64}()
        for i in 1:length(model.agents)
            push!(groupv,model.agents[i].group)
        end
    group_sizes=counts(groupv)
    return(fun(group_sizes[setdiff(1:end, 1), :]))
end


# spezialfall mean
function mean_agent_gs(model)
    groupv = Vector{Int64}()
        for i in 1:length(model.agents)
            push!(groupv,model.agents[i].polym)
        end
    group_sizes=counts(groupv)
   mean_gs=mean(group_sizes[setdiff(1:end, 1), :])
    return(mean_gs)
end

# spezialfall sd
function std_gs(model, fun)
    group = Vector{Int64}()
        for i in 1:length(model.agents)
            push!(group,model.agents[i].polym)
        end
    group_sizes=counts(group)
    std_group=std(group_sizes[setdiff(1:end, 1), :])
    return(std_group)
end