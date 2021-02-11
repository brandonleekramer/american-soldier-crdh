### American Soldier CRDH Repository 

Project authors: Ed Gitre, Brandon Kramer, Chase Dawson, Gizem Korkmaz 

In this repo, we outline our workflow for "Using Text Networks to Examine American Soldier’s Perspectives on Racial Segregation during World War II" paper. While this project derives from work conducted during the [2020 Data Science for the Public Good](https://sites.google.com/vt.edu/theamericansoldier/about-the-project) summer program, we have separated this repo to allow other scholars to use the code more effectively. For those interested in the larger project, we the American Soldier website in addition to our [DSPG project website](https://dspg-young-scholars-program.github.io/dspg20amsoldier/?dspg) and [DSPG GitHub repository](https://github.com/DSPG-Young-Scholars-Program/dspg2020amsoldier) for additional analyses. 

Below is an outline of the repository: 

    ├── data 
        ├── dictionaries
            ├── collapse_words.csv
        ├── outputs
            ├── black_edgelist
            ├── black_nodelist
            ├── white_edgelist
            ├── white_nodelist
            ├── wb_edgelist
            ├── wb_nodelist
            ├── wb_network.gexf
    ├── functions
        ├── load_data.R
        ├── unstem_words.R
    ├── src
        ├── 01_create-text-networks.Rmd
        ├── 02_crdh-visualizations.Rmd 
    ├── static 
        ├── black_network
        ├── white_network
        ├── multilayered_with_comm_colors
        ├── multilayered_wo_comm_colors