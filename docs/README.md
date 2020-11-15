# Path organisation of docs

```
~/srep2020/docs$ tree -d
.
├── corrections
│   ├── 2019-03-29
│   │   ├── comments
│   │   └── logbook
│   ├── 2020-01-14
│   │   ├── comments
│   │   └── report
│   └── 2020-07-03
│       ├── comments
│       └── report
├── figures
│   ├── caoami
│   │   ├── pdf
│   │   ├── src
│   │   └── vector
│   ├── experiment
│   │   ├── hri
│   │   │   ├── pdf
│   │   │   └── vector
│   │   └── sts
│   │       ├── pdf
│   │       └── vector
│   ├── figures-originals
│   │   ├── appendices
│   │   │   ├── appendixA
│   │   │   │   ├── data
│   │   │   │   │   ├── first_experiment
│   │   │   │   │   │   ├── muse
│   │   │   │   │   │   └── video
│   │   │   │   │   └── second_experiment
│   │   │   │   │       ├── muse
│   │   │   │   │       └── video
│   │   │   │   ├── main
│   │   │   │   ├── outcomes
│   │   │   │   │   ├── figure_second_experiment
│   │   │   │   │   └── timedelayembedding
│   │   │   │   ├── r-scripts
│   │   │   │   │   └── time_delay_embedding
│   │   │   │   └── sketchs_for_trajectories
│   │   │   │       ├── experiment_trajectories
│   │   │   │       │   ├── v00
│   │   │   │       │   ├── v01
│   │   │   │       │   └── v02
│   │   │   │       └── figures
│   │   │   │           ├── trajectories
│   │   │   │           └── trajectory1a
│   │   │   └── appendixB
│   │   │       └── neMEMsi
│   │   │           └── references
│   │   ├── averageMutualInformation
│   │   │   └── example
│   │   │       ├── ami_plots
│   │   │       └── plots_path
│   │   ├── experiment
│   │   │   ├── hri
│   │   │   └── speedtimeseries
│   │   │       ├── v00
│   │   │       └── v01
│   │   ├── falseNearestNeighbours
│   │   │   ├── cao97
│   │   │   │   ├── forChoaticTimeSeries
│   │   │   │   │   └── plots_path
│   │   │   │   ├── forPeriodicTimeSeries
│   │   │   │   │   ├── plots_path
│   │   │   │   │   │   ├── results_with_200samples
│   │   │   │   │   │   │   └── figure
│   │   │   │   │   │   └── results_with_400samples
│   │   │   │   │   │       └── figure
│   │   │   │   │   └── plots_periodic_path
│   │   │   │   └── forRandomTimeSeries
│   │   │   │       └── plots_path
│   │   │   └── timeseries
│   │   │       ├── chaoticTimeSeries
│   │   │       ├── periodicTimeSeries
│   │   │       └── variablePeriodicTimeSeries
│   │   ├── imus
│   │   ├── results
│   │   │   ├── rqa
│   │   │   │   ├── v00
│   │   │   │   ├── v01
│   │   │   │   │   ├── rp_plots
│   │   │   │   │   ├── rqa_plots
│   │   │   │   │   └── timeseries_plots
│   │   │   │   ├── v02
│   │   │   │   │   ├── rp_plots
│   │   │   │   │   ├── rqa_plots
│   │   │   │   │   └── timeseries_plots
│   │   │   │   └── v03
│   │   │   │       ├── rp_plots
│   │   │   │       │   └── figs
│   │   │   │       ├── rqa_plots
│   │   │   │       │   ├── figs
│   │   │   │       │   └── topologies
│   │   │   │       │       ├── figs
│   │   │   │       │       ├── p01
│   │   │   │       │       ├── p02
│   │   │   │       │       └── p03
│   │   │   │       └── timeseries_plots
│   │   │   ├── timeseries
│   │   │   │   └── smoothness
│   │   │   │       ├── v0
│   │   │   │       ├── v00
│   │   │   │       ├── v01
│   │   │   │       ├── v02
│   │   │   │       ├── v03
│   │   │   │       └── v04
│   │   │   └── utde
│   │   │       ├── minimum_embedding_parameters
│   │   │       │   ├── ami
│   │   │       │   │   ├── v00
│   │   │       │   │   ├── v01
│   │   │       │   │   ├── v02
│   │   │       │   │   └── v03
│   │   │       │   │       └── figs
│   │   │       │   └── cao
│   │   │       │       ├── v01
│   │   │       │       ├── v02
│   │   │       │       └── v03
│   │   │       │           └── figs
│   │   │       └── rss
│   │   │           ├── v00
│   │   │           ├── v01
│   │   │           ├── v02
│   │   │           └── v03
│   │   │               └── w10-dim006tau008
│   │   │                   └── figs
│   │   ├── rqa
│   │   │   ├── figure11
│   │   │   │   ├── v00
│   │   │   │   ├── v01
│   │   │   │   └── v02
│   │   │   ├── figure12
│   │   │   │   ├── v00
│   │   │   │   ├── v01
│   │   │   │   └── v02
│   │   │   ├── figure12-rp
│   │   │   │   ├── v00
│   │   │   │   └── v01
│   │   │   ├── figure12-timeseries
│   │   │   │   └── v01
│   │   │   └── functions
│   │   └── rss
│   │       ├── allowed_embedding_parameters
│   │       ├── casdagli1991
│   │       │   └── figure1
│   │       ├── forPeriodicTimeSeries
│   │       ├── quintana-duque2012
│   │       │   ├── figure1
│   │       │   └── figure2
│   │       ├── uniform-time-delay-embedding
│   │       │   └── drawing
│   │       └── ye2015
│   │           └── figureS1
│   ├── methods
│   │   ├── ami
│   │   │   ├── pdf
│   │   │   └── vector
│   │   ├── cao
│   │   │   ├── pdf
│   │   │   └── vector
│   │   ├── rp
│   │   │   ├── pdf
│   │   │   └── vector
│   │   ├── rpsp
│   │   │   ├── pdf
│   │   │   └── vector
│   │   └── rss
│   │       ├── pdf
│   │       └── vector
│   ├── rps
│   │   ├── pdf
│   │   ├── src
│   │   │   ├── rp_plots
│   │   │   │   ├── H
│   │   │   │   └── V
│   │   │   └── timeseries_plots
│   │   └── vector
│   ├── rqa
│   │   ├── output
│   │   │   └── epsilons
│   │   ├── src
│   │   │   ├── 3drqa_epsilons
│   │   │   │   ├── p01-w100-Horizontal
│   │   │   │   ├── p01-w100-Vertical
│   │   │   │   ├── p01-w250-Horizontal
│   │   │   │   ├── p01-w250-Vertical
│   │   │   │   ├── p01-w500-Horizontal
│   │   │   │   ├── p01-w500-Vertical
│   │   │   │   ├── p01-w750-Horizontal
│   │   │   │   ├── p01-w750-Vertical
│   │   │   │   ├── p02-w100-Horizontal
│   │   │   │   ├── p02-w100-Vertical
│   │   │   │   ├── p02-w250-Horizontal
│   │   │   │   ├── p02-w250-Vertical
│   │   │   │   ├── p02-w500-Horizontal
│   │   │   │   ├── p02-w500-Vertical
│   │   │   │   ├── p02-w750-Horizontal
│   │   │   │   ├── p02-w750-Vertical
│   │   │   │   ├── p03-w100-Horizontal
│   │   │   │   ├── p03-w100-Vertical
│   │   │   │   ├── p03-w250-Horizontal
│   │   │   │   ├── p03-w250-Vertical
│   │   │   │   ├── p03-w500-Horizontal
│   │   │   │   ├── p03-w500-Vertical
│   │   │   │   ├── p03-w750-Horizontal
│   │   │   │   └── p03-w750-Vertical
│   │   │   ├── 3drqa_sensors_activities
│   │   │   ├── H
│   │   │   └── V
│   │   └── vectorfiles
│   │       └── epsilons
│   ├── rss
│   │   ├── pdf
│   │   ├── src
│   │   │   └── w10-dim006tau008
│   │   └── vector
│   └── timeseries
│       ├── pdf
│       ├── src
│       └── vector
├── manuscript
├── references
│   ├── aguirre2009
│   ├── anguita2013
│   ├── apthorp2014
│   ├── bradley2015
│   ├── cao1997
│   ├── casdagli1991
│   ├── comotti2014
│   ├── curtin2017
│   ├── davids2002
│   ├── deVries1982
│   ├── duran2017
│   ├── eager2016
│   ├── eckmann1987
│   ├── emrani2014
│   ├── flash1985
│   ├── frank2010
│   ├── fraser1986
│   ├── garcia2005e71
│   ├── garland2016
│   ├── gibson1992
│   ├── gomez-garcia2014
│   ├── gouaillier2009
│   ├── iwanski1998
│   ├── judd1998
│   ├── kabiraj2012
│   ├── kennel1992
│   ├── kim1998
│   ├── krakovska2015
│   ├── kugiumtzis1996
│   ├── lettelier2006
│   ├── marwan2007
│   ├── marwan2008
│   ├── marwan2011
│   ├── marwan2015
│   ├── mori2012
│   ├── packard1980
│   ├── pecora2007
│   ├── press1992
│   ├── quintana-duque2012
│   ├── quintana-duque2016
│   ├── rhea2011
│   ├── rosenstein1994
│   ├── sama2013
│   ├── savitzky-golay1964
│   ├── schafer2011
│   ├── shoaib2016
│   ├── small2004
│   ├── stergiou2011
│   ├── takens1981
│   ├── trulla1996
│   ├── uzal2010
│   ├── uzal2011
│   └── zbilut1992
├── submission
│   ├── arxiv
│   │   ├── v01
│   │   └── v02
│   └── srep
│       └── coverletter
└── supplementary-information
    └── report

283 directories
```
