# Data retrieval functions
# Function to calculate mean of microtubule length
function mean_MT_size(model)
    meanMTL=mean(counts([model.agents[i].polym for i in 1:length(model.agents)])[setdiff(1:end, 1), 1])
    # i remove the first index of counts ( polym==0 ) since this group doesnt represent a MT
end

# Function to calculate standart devation of microtubule length
function sd_MT_size(model)
    stdMTL=std(counts([model.agents[i].polym for i in 1:length(model.agents)])[setdiff(1:end, 1), 1])
end

# MSD function
function MSD(data)   
    n_ids= maximum(data.id)
    n_steps=maximum(data.step)+1
    r=1:n_ids:n_steps*n_ids+n_ids
    poses=hcat(collect.(data.pos)...)
    x_0=poses[1,unique(data.id)]
    y_0=poses[2,unique(data.id)]
    MSD = zeros(n_steps) #array länge data.step init zeros()
        for i in 1:n_steps
            MSD[i]=mean(sqrt.((poses[1,r[i]:r[i+1]-1].-x_0).^2 + (poses[2,r[i]:r[i+1]-1].-y_0).^2))
        end
    return MSD
end


function growth_rate!(df) 
    df.growthrate=zeros(nrow(df))
    for n in 2:nrow(df)
        if df.step[n]>1
            df.growthrate[n]= -(df[n,:mean_MT_size_mean],df[n-1,:mean_MT_size_mean])
        end
    end
end