#creates the spec file for alpha impute

create_spec_file <- function(output_path, num_SNPs) {
    
    # specify first 5 haplotype lengths as between 10 and 30 percent of chromosome
    # specify second 5 haplotype lengths in between the first five with some +- (recommended by John)
    first_five <- round(seq(from = 0.05, to = 0.30, by = 0.06) * num_SNPs, digits = 0)
    second_five <- round(first_five + (first_five[2] - first_five[1])/2 + runif(5, -0.05*first_five[1], 0.05*first_five[1]), 0)
    
    # specify core and tail around a 100 longer than core, as recommended by Andrew
    core_lengths <- paste(c(first_five, second_five), collapse = ",")
    core_tail_lengths <- paste(c(first_five, second_five) + 100, collapse = ",")
    
    writeLines(
        con = paste0(output_path, "AlphaImputeSpec.txt"),
        text = c(
            "= BOX 1: Input Files ================================================================",
            "PedigreeFile                        ,Pedigree.txt",
            "GenotypeFile                        ,Genotypes.txt",
            #"TrueGenotypeFile                    ,TrueGenotypes.txt"
            "= BOX 2: Sex Chromosome =============================================================",
            "SexChrom                            ,Yes, sex_chr_impute_table.txt, Male", # Yes, add_file, Male 
            "= BOX 3: SNPs =======================================================================",
            paste0("NumberSnp                     ,",num_SNPs),
            "= BOX 4: Filtering ==================================================================",
            #"InternalEdit                        ,No",
            #"EditingParameters,                  ,95.0,2.0,98.0,EditedSnpOut",
            "= BOX 5: Phasing ====================================================================",
            "HDAnimalsThreshold                  ,50.0",
            "NumberPhasingRuns                   ,10",
            paste0("CoreAndTailLengths                  ,", core_tail_lengths),
            paste0("CoreLengths                         ,", core_lengths),
            "PedigreeFreePhasing                 ,No",
            #"GenotypeError                       ,0.5",
            #"LargeDatasets                       ,Yes, 20, 1, RandomOrder",
            "= BOX 6: Imputation =================================================================",
            "InternalIterations                  ,5",   
            "ConservativeHaplotypeLibraryUse     ,No",
            "ModelRecomb                         ,No",
            "= BOX 7: Hidden Markov Model ========================================================",
            "HMMOption                           ,Only",
            "TemplateHaplotypes                  ,50",    # if insufficient accuracy increase to 50 or 100 but much slower
            "BurnInRounds                        ,5",
            "Rounds                              ,20",
            #"Seed                                ,-123456789",
            #"ThresholdImputed                    ,90.0",
            "= BOX 8: Running options ============================================================",
            "PreprocessDataOnly                  ,No",
            "ParallelProcessors                  ,10",
            "AlphaPhaseOutput                    ,No",
           # "PhasingOnly                         ,No",
           # "UserDefinedAlphaPhaseAnimalsFile    ,None",
           # "PrePhasedFile                       ,None",
           # "useferdosi                          ,No",
           #  "Cluster                             ,No",
            "= BOX 9: Output ======================================================================",
           # "ResultFolderPath                    ,",
            "OutputOnlyGenotypedAnimals          ,Yes",
            "RestartOption                       ,0",
            "WellPhasedThreshold                 ,99.0"
        ))
}
    
