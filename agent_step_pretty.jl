                  
function agent_step!(agent,model)
    if agent.id > model.Nstarts   # skip startingpoints
       dirs = collect(nearby_positions(agent, model,1))             
         if agent.polym == 0          # Logic for unpolimerized agents:
              walk!(agent, rand, model, ifempty =true)   # random walk
                for id in nearby_ids(agent, model,1)       # iterator over nearby ids  
                if  model[id].polym >= 1  && model[id].pos == collect(nearby_positions(agent, model,1))[8]  
                        agent.polym = rand(model.P_polym,1)[1] ==1 ? model[id].polym : 0 # polimerize and get MT number
                    end
                end
             end
         if agent.polym > 0             # Logic for polymerized agents: 
            if agent.GDP == false                  # if not hydrolized
                agent.GDP = rand(model.P_hyd,1)[1]       # hydrolize with P_hyd
                end
             if  isempty(dirs[1], model) 
                if agent.GDP  # if hydrolized
                    agent.polym = rand(model.P_depolym_GDP,1)[1]== 1  ? agent.polym : 0
                else
                    agent.polym = rand(model.P_depolym_GTP,1)[1]== 1  ? agent.polym : 0 
                    end
                end
          end 
    end
end
