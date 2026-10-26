This application implements Value at Risk by means of a Montecarlo Simulation over a sample,
hard-coded, asset portfolio. You can vary the interest rate and the "market volatility".

The application taken from the collection of examples at

http://fura.sourceforge.net/

Specifically from

http://sourceforge.net/apps/mediawiki/fura/index.php?title=Financial_and_banking

It is provided solely to demonstrate that GridFactory - I've been not been able to find the
source code, so what more precisely the program does and whatin the asset portfolio consists
is not known.

Below follows the content of the README file distributed by Fura.

--------------------------


This test module computes the value at risk of a simple portfolio in parallel

*Requirements:

you need perl in the server, which it is used to perform the postprocessing step.
The gnuplot is used to generate two graphical plots with the final results. If gnuplot 
or perl are not present, only the text files with the final data will be available.

*Description:

The module consists in a multiplatform executable (C++ code) which performs a local
calculation of the value at risk of a simple finantial portfolio. Each local computation
is performed in different theoretical scenarios (i.e., different future interest rates
or market volatilities).

As output, it generates histograms for each combination of scenario parameters (.dat files). 
This is used to get the value at risk. 

There is a postprocess perl script (postproces.pl) which reads all the results and 
plots the data by using gnuplot. It generates gifs that can be viewed from the results link.

*Integration in innerGrid:

To integrate the module in innerGrid you should do the following:

1) Create a module with the executable VaR. VaR is fed with 9 parameters, each one of them
can be used as a changing scenario. It has an special finantial interest to vary the
market interest rate and the market volatility (the first two parameters). The remaining
parameters are: the spot price of an American Option, its maturity, its strike price,
the number of MonteCarlo simulations to get each histrogram, the number of iterations for
each simulation, the confidence level and the horizon.

The results are stored in .dat files, which should be indicated in the results filter.

You can use the default exit codes.

The postprocess is a call to postproces.pl, which plots the final graphs which summarize all
the information. In InnerGrid, the call would then be "perl -w postproces.pl" (note that the 
executable file is postproces.pl, not perl)

2) Create a task. A typical choice would be the following:

- interest rate, ranging from 2% to 8% with a step of 0.5%
- market volatility, ranging from 20% to 40% with a step of 2%
- spot price: 22
- maturity: 100 days
- strike price: 25
- number of MonteCarlo simulations: 50000
- number of iterations: 1
- confidence level: 99%
- time horizon: 1 day

3) After running the task, click the link "View results". There you will see all the
files with the partial histogram data (*.dat) and the aggregated final plots (*.gif)


