# ABM microtubule dynamics

This repository contains Julia skripts to model and test the dynamical instabilty of PROTOFILAMENTS of Microtubules in silicio.

The model is an Agent Based Model with a two dimensional periodic gridspace .


### Agents 
 
The agents, representing α-& β- tubulin dimers, are implemented by a
mutable struct tubulin <: AbstractAgent
containing the Fields:

    - id::Int64
    - pos::Tuple{Int64, Int64}
    - polym::Int64
    - GDP::Bool

Supertype Hierarchy:
      
      tubulin <: AbstractAgent <: Any
    
see file agent.jl

### Model

The Model itself is a struct 

`AgentBasedModel{GridSpace{2, true, Nothing}, tubulin, typeof(Agents.Schedulers.randomly), Dict{Symbol, Any}, Random.MersenneTwister} <: Any`

Fields

	- space::GridSpace{2, true, Nothing}
	- agents::Dict{Int64, tubulin}
	- scheduler::typeof(Agents.Schedulers.randomly)
	- properties::Dict{Symbol, Any}
	- rng::Random.MersenneTwister
	- maxid::Base.RefValue{Int64}

### Model Properties :

    - Gridsize::Tuple{Int,2}
    - Number of agents::tubulin
    - Number of Seeding Points
    
   Random (Binomial) distributed:
    
    - Polimerization rate ,p
    - Hydrolisation rate , p
    - Depolymerisation rate_GTP
    - Depolymerisation rate_GDP
    

    
### Model Intiztialisation

Model intialisation is done by running the init.jl script to load the initialise() function
with chosen model properties   
### Stepping rules


Stepping rules for the model are created by running ´modelstep.jl´ 


Stepping rules for the agents are created by either running `agentstep_pretty.jl` or `agentstep_fast.jl`






#### Agentstep function speed

`@btime step!(model,agent_step!,model_step!,10)`
    Agent Step pretty: 12.705 ms (155651 allocations: 10.33 MiB)
    Agent Step fast:   10.830 ms (90021 allocations: 4.34 MiB)
