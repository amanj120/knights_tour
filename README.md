# Knights Tour

Website: http://knights-tour-nn.ue.r.appspot.com/


based off of [this paper](https://www.researchgate.net/publication/222346901_Neural_network_computing_for_knight%27s_tour_problems)

Check out `simd_nn/simd3.c` to check out how I optimized the solution using Intel Intrinsics.

I am working on a small jupyter notebook to be able to randomly generate closed Knights Tour.

The end goal of this project is to have an easily scalable system in order to enumerate ALL 26 Trillion Closed Knight's Tours.

The `results` folder contains text files with outputted knights tours, however they are not yet easy to translate
