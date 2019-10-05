# creates spec file
# Core lengths starting from 10% 


create_spec_file <- function(output_path, num_SNPs) {
    
    # specify first 5 haplotype lengths as between 10 and 30 percent of chromosome
    # specify second 5 haplotype lengths in between the first five with some +- (recommended by John)
    first_five <- round(seq(from = 0.01, to = 0.05, by = 0.01) * num_SNPs, digits = 0)
    second_five <- round(first_five + (first_five[2] - first_five[1])/2 + runif(5, -0.05*first_five[1], 0.05*first_five[1]), 0)

    # specify core and tail around a 100 longer than core, as recommended by Andrew
    core_lengths <- paste(c(first_five, second_five), collapse = ",")
    core_tail_lengths <- paste(c(first_five, second_five) + 50, collapse = ",")
    
    sink(paste0(output_path, "AlphaImputeSpec.txt"))
    cat("= BOX 1: Input Files ================================================================", "\n")
    cat("PedigreeFile                        ,Pedigree.txt",                                     "\n")
    cat("GenotypeFile                        ,Genotypes.txt",                                    "\n")
    # cat("TrueGenotypeFile                    ,TrueGenotypes.txt",                                "\n")
    cat("= BOX 2: Sex Chromosome =============================================================", "\n")
    cat("SexChrom                            ,No",                                               "\n")
    cat("= BOX 3: SNPs =======================================================================", "\n")
    #cat("NumberSnp                           ,45010",                                            "\n")
    cat(paste0("NumberSnp                     ,",num_SNPs),                                       "\n")
    #cat("MultipleHDPanels                    ,1",                                               "\n")
    cat("= BOX 4: Filtering ===========================================================",        "\n")
    #cat("InternalEdit                        ,No",                                               "\n")
    #cat("EditingParameters,                  ,95.0,2.0,98.0,EditedSnpOut",                       "\n")
    cat("= BOX 5: Phasing ====================================================================", "\n")
    cat("HDAnimalsThreshold                  ,50.0",                                             "\n")
    cat("NumberPhasingRuns                   ,10",                                                "\n")
    # a bit longer than core length (+ 100 or 200)
    cat(paste0("CoreAndTailLengths                  ,", core_tail_lengths),                              "\n")
    # should be around 10 to 30 % of the SNPs on the chromosome for the first five, and then the second five more random numbers intermediate to the ones before
    cat(paste0("CoreLengths                         ,", core_lengths),                                   "\n")
    cat("PedigreeFreePhasing                 ,No",                                               "\n")
    # cat("GenotypeError                       ,0.5",                                              "\n")
    #cat("LargeDatasets                       ,Yes, 20, 1, RandomOrder",                         "\n")
    cat("= BOX 6: Imputation =================================================================",  "\n")
    cat("InternalIterations                  ,5",                                                "\n")
    cat("ConservativeHaplotypeLibraryUse     ,No",                                               "\n")
    cat("ModelRecomb                         ,Yes",                                              "\n")
    cat("= BOX 7: Hidden Markov Model ========================================================", "\n")
    cat("HMMOption                           ,No",                                               "\n")   # check this method out with "also"
    cat("TemplateHaplotypes                  ,20",                                                "\n")   # if insufficient accuracy increase to 50 or 100 but much slower
    cat("BurnInRounds                        ,5",  "\n")
    cat("Rounds                              ,20",  "\n")
    #cat("Seed                                ,-123456789",  "\n")
    #cat("ThresholdImputed                    ,90.0",  "\n")
    cat("= BOX 8: Running options ============================================================",  "\n")
    cat("PreprocessDataOnly                  ,No",                                                "\n")
    cat("ParallelProcessors                  ,10",                                                "\n")
    cat("AlphaPhaseOutput                    ,No",                                               "\n") #
    #cat("PhasingOnly                         ,No",  "\n")
    #cat("UserDefinedAlphaPhaseAnimalsFile    ,None",  "\n")
    #cat("PrePhasedFile                       ,None",  "\n")
    #cat("useferdosi                          ,No",  "\n")
    #cat("Cluster                             ,No",  "\n")
    cat("= BOX 9: Output ============================================================",          "\n")
    #cat("ResultFolderPath                    ,")
    cat("OutputOnlyGenotypedAnimals          ,Yes",                                              "\n") # potentially set to yes
    cat("RestartOption                       ,0",                                                "\n") # 0 = all steps
    cat("WellPhasedThreshold                 ,99.0",                                             "\n")
    sink()
    
}


