#output_path <- "main_files_cv_full/"

create_spec_file <- function(output_path, num_SNPs) {

sink(paste0(output_path, "AlphaImputeSpec.txt"))
cat("= BOX 1: Input Files ================================================================", "\n")
cat("PedigreeFile                        ,Pedigree.txt",                                     "\n")
cat("GenotypeFile                        ,Genotypes.txt",                                    "\n")
# cat("TrueGenotypeFile                    ,TrueGenotypes.txt",                                "\n")
cat("= BOX 2: Sex Chromosome =============================================================", "\n")
cat("SexChrom                            ,No",                                               "\n")
cat("= BOX 3: SNPs =======================================================================", "\n")
#cat("NumberSnp                           ,45010",                                            "\n")
cat(paste0("NumberSnp                     ,",num_SNPs),                                            "\n")
#cat("MultipleHDPanels                    ,1",                                               "\n")
cat("= BOX 4: Filtering ===========================================================",        "\n")
#cat("InternalEdit                        ,No",                                               "\n")
#cat("EditingParameters,                  ,95.0,2.0,98.0,EditedSnpOut",                       "\n")
cat("= BOX 5: Phasing ====================================================================", "\n")
cat("HDAnimalsThreshold                  ,50.0",                                             "\n")
cat("NumberPhasingRuns                   ,5",                                                "\n")
cat("CoreAndTailLengths                  ,100,200,300,400,500",                                  "\n")
cat("CoreLengths                         ,50,150,250,350,450",                                  "\n")
cat("PedigreeFreePhasing                 ,No",                                               "\n")
cat("GenotypeError                       ,0.5",                                              "\n")
#cat("LargeDatasets                       ,Yes, 20, 1, RandomOrder",                         "\n")
cat("AlphaPhaseOutput                    ,No",                                              "\n")
cat("= BOX 6: Imputation =================================================================",  "\n")
cat("InternalIterations                  ,5",                                                "\n")
cat("ConservativeHaplotypeLibraryUse     ,No",                                               "\n")
cat("ModelRecomb                         ,Yes",                                              "\n")
cat("= BOX 7: Hidden Markov Model ========================================================", "\n")
cat("HMMOption                           ,No",                                               "\n")   # check this method out with "also"
#cat("TemplateHaplotypes                  ,200",  "\n")
#cat("BurnInRounds                        ,5",  "\n")
#cat("Rounds                              ,20",  "\n")
#cat("ParallelProcessors                  ,2",  "\n")
#cat("Seed                                ,-123456789",  "\n")
#cat("ThresholdImputed                    ,90.0",  "\n")
cat("= BOX 8: Running options ============================================================",  "\n")
cat("PreprocessDataOnly                  ,No",                                                "\n")
cat("ParallelProcessors                  ,10",                                                "\n")
#cat("AlphaPhaseOutput                    ,Yes",                                               "\n") #
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


