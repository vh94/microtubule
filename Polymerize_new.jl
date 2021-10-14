# Neighborhood function for periodic Grids

function periodic_agent_hood(agent,model)
    agenthood=[[i,j] for i=-1:1 ,j=-1:1] #  muss als vector init um:
    for i in 1:length(agenthood) 
        agenthood[i] = agenthood[i] .+ agent.pos
        agenthood[i][agenthood[i].<1] .= model.griddims[1] # diese line auszuführen zu können
        agenthood[i]= mod1.(agenthood[i],model.griddims[1])
    end
    agenthood # ist eine matrix mit vectoren [x,y]
end

# Polymerisation
function polymerize(agent,model)
for id in nearby_ids(agent, model,1) # 
                if  model[id].polym >= 1  
                   if collect(model[id].pos) == periodic_agent_hood(agent,model)[9] # model id wird auch in vector umgewandelt
                        agent.polym = rand(model.P_polym,1)[1] ==1 ? model[id].polym : 0 # ! rand is called here !
                    end
                end
             end
end

# Delymerisation
function depolymerize(agent,model)
           sw = tuple(periodic_agent_hood(agent,model)[1]...) # bzw periodic_agent_hood wieder in tuple
        if isempty(sw, model) 
                if agent.GDP  # if hydrolized
                    agent.polym = rand(model.P_depolym_GDP,1)[1]== 1  ? agent.polym : 0 # ! rand is called here !
                else
                    agent.polym = rand(model.P_depolym_GTP,1)[1]== 1  ? agent.polym : 0 # ! rand is called here !
                end
            end 
end