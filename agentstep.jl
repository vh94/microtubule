# Periodic agent step function
 # TODO: bounce check für agenten in eigene funktion aussiedeln
function agent_step!(agent,model)
    if agent.id > model.Nstarts  
        if agent.polym == false   # Logic for unpolymerized agents:    
             walk!(agent, rand, model, ifempty =true)#
            for id in nearby_ids(agent, model,1) # 
                if  model[id].polym == true
                   if model[id].pos[1] == agent.pos[1] + 1 && model[id].pos[2] == agent.pos[2] + 1  || model[id].pos[1] == 1 && agent.pos[1] == model.griddims[1] && model[id].pos[2] == agent.pos[2]+1 || model[id].pos[1] == agent.pos[1] + 1 && model[id].pos[2] == 1 && agent.pos[2] == model.griddims[2]|| model[id].pos[1] == 1 && agent.pos[1] == model.griddims[1] && model[id].pos[2] == 1 && agent.pos[2] == model.griddims[2]
                        agent.polym = rand(model.P_polym,1)[1] 
                    end
                end
             end
        end
    if agent.polym
        if agent.GDP == false   # if not hydrolized
            agent.GDP = rand(model.P_hyd,1)[1] # hydrolize with P_hyd
        end
         if agent.pos[1]>1 && agent.pos[2]>1 && isempty(tuple(agent.pos[1]-1,agent.pos[2]-1),model) || agent.pos[1]==1 && agent.pos[2]>1 && isempty(tuple(model.griddims[1],agent.pos[2]-1),model)   || agent.pos[1]>1 && agent.pos[2]==1 && isempty(tuple(agent.pos[1]-1,model.griddims[2]),model)|| agent.pos[1]==1 && agent.pos[2]==1 && isempty(tuple(model.griddims[2],model.griddims[2]),model) || agent.pos[1] == model.griddims[1] && agent.pos[2]>1 && isempty(tuple(1, agent.pos[2]-1))|| agent.pos[1]>1 && agent.pos[2] == model.griddims[2] && isempty(tuple(agent.pos[2]-1,1 ))     
                if agent.GDP  # if hydrolized
                    agent.polym = rand(model.P_depolym_GDP,1)[1] # depolyimerize with P_depolym_GDP
                else
                    agent.polym = rand(model.P_depolym_GTP,1)[1] # depolyimerize with P_depolym_GTP
                end
            end 
        end
    end
end
print("\ncreated agent-step function.")