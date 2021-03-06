
        

    function PLacExampleUtility(ins)

        # Definition of the inputs for the ODEs
        if length(ins) == 1
            IPTG2,IPTG3 = ins[1];
        else
            IPTG2,IPTG3 = ins;
        end
        inputsMC = [0,IPTG2,IPTG3];

        # Solve ODEs
        solMC = PLacExample_SolveAll(tsMC, pD1MC, spMC, inputsMC, ivss1MC, sampsMC, pre1MC);

        # Extracte wanted vectors (observables) with time reduction
        Obs1_MC = 3 .*solMC[:,4,:]; 


    
        LowqObs1_MC = zeros(size(solMC)[1]); 

        HighqObs1_MC = zeros(size(solMC)[1]); 

        for i in 1:size(solMC)[1]
            LowqObs1_MC[i] = percentile(Obs1_MC[i,:],0.5); 

            HighqObs1_MC[i] = percentile(Obs1_MC[i,:],99.5); 

        end

        # Compute Euclidean distances
        EuObs1_MC = sqrt(sum((LowqObs1_MC-HighqObs1_MC).^2)); 

        util = (EuObs1_MC)*(1/1);
    

        return(util)
    end

        