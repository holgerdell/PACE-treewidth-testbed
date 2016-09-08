PSPLOTS = he.ps ex.ps hehist.ps hesestat.ps hepastat.ps ex-dimacs.ps ex-contiki.ps exhe-dimacs.ps

.PHONY: all
all: $(PSPLOTS:.ps=.png)

.PHONY: clean
clean:
	rm -f *.png *.out *.ps


%.png: %.ps
	convert -density 600 $< $@

ex.ps: ex.out
	reset;
	set datafile separator ";";
	set title "Performance of exact sequential submissions (Treewidth vs. Running time)";
	set terminal postscript color enhanced font 'Helvetica,14' eps;
#	set terminal wxt size 350,262 enhanced font 'Verdana,10' persist;
	set style line 1 lc rgb '#0060ad' pt 6 ps 1 lt 1 lw 1;
	set style line 2 lc rgb '#00AA00'     pt 2 ps 1 lt 1 lw 1;
	set style line 3 lc rgb 'red'    pt 4 ps 1 lt 1 lw 1;
	set style line 4 lc rgb 'blue'  pt 8 ps 1 lt 1 lw 1;
	set output '$@';
	set style line 11 lc rgb '#808080' lt 1;
	set border 3 back ls 11;
	set style line 12 lc rgb'#808080' lt 0 lw 1;
	set grid back ls 12;
	set xrange [0:60];
	set logscale y;
	set yrange [0.01:10000];
	set ytics 0.01,10;
	set mytics 1;
	set xlabel "Treewidth+1";
	set ylabel "Running time (seconds)";
	set key on Left inside top right reverse box spacing 4 width -2;
	plot
	"< awk -v FS=' *; *' '{if($$3 == \"0\") print}' $<" u 8:11 t "Frankfurt University" w p ls 1,
	"< awk -v FS=' *; *' '{if($$3 == \"3\") print}' $<" u 8:11 t "Utrecht University" w p ls 2,
	"< awk -v FS=' *; *' '{if($$3 == \"6\") print}' $<" u 8:11 t "Luebeck University" w p ls 3,
	"< awk -v FS=' *; *' '{if($$3 == \"7\") print}' $<" u 8:11 t "Meiji University" w p ls 4

ex-dimacs.ps: ex.out
	reset;
	set datafile separator ";";
	set title "Performance on DIMACS graph coloring instances (Treewidth vs. Running time)";
	set terminal postscript color enhanced font 'Helvetica,14' eps;
#	set terminal wxt size 350,262 enhanced font 'Verdana,10' persist;
	set style line 1 lc rgb '#0060ad' pt 6 ps 1 lt 1 lw 1;
	set style line 2 lc rgb '#00AA00'     pt 2 ps 1 lt 1 lw 1;
	set style line 3 lc rgb 'red'    pt 4 ps 1 lt 1 lw 1;
	set style line 4 lc rgb 'blue'  pt 8 ps 1 lt 1 lw 1;
	set output '$@';
	set style line 11 lc rgb '#808080' lt 1;
	set border 3 back ls 11;
	set style line 12 lc rgb'#808080' lt 0 lw 1;
	set grid back ls 12;
	set xrange [0:60];
	set logscale y;
	set yrange [0.01:10000];
	set ytics 0.01,10;
	set mytics 1;
	set xlabel "Treewidth+1";
	set ylabel "Running time (seconds)";
	set key on Left inside top right reverse box spacing 4;
	plot
	"< awk -v FS=' *; *' '{if($$3 == \"0\" && index($$6, \"dimacs\")) print}' $<" u 8:11 t "Frankfurt University" w p ls 1,
	"< awk -v FS=' *; *' '{if($$3 == \"3\" && index($$6, \"dimacs\")) print}' $<" u 8:11 t "Utrecht University" w p ls 2,
	"< awk -v FS=' *; *' '{if($$3 == \"6\" && index($$6, \"dimacs\")) print}' $<" u 8:11 t "Luebeck University" w p ls 3,
	"< awk -v FS=' *; *' '{if($$3 == \"7\" && index($$6, \"dimacs\")) print}' $<" u 8:11 t "Meiji University" w p ls 4

exhe-dimacs.ps: ex.out he.out
	reset;
	set datafile separator ";";
	set title "Performance on DIMACS graph coloring instances (Treewidth vs. Running time)";
	set terminal postscript color enhanced font 'Helvetica,14' eps;
#	set terminal wxt size 350,262 enhanced font 'Verdana,10' persist;
	set style line 1 lc rgb '#0060ad' pt 6 ps 1 lt 1 lw 1;
	set style line 2 lc rgb '#00AA00'     pt 2 ps 1 lt 1 lw 1;
	set style line 3 lc rgb 'red'    pt 4 ps 1 lt 1 lw 1;
	set style line 4 lc rgb 'blue'  pt 8 ps 1 lt 1 lw 1;
	set output '$@';
	set style line 11 lc rgb '#808080' lt 1;
	set border 3 back ls 11;
	set style line 12 lc rgb'#808080' lt 0 lw 1;
	set grid back ls 12;
	set xrange [0:60];
	set logscale y;
	set yrange [0.01:10000];
	set ytics 0.01,10;
	set mytics 1;
	set xlabel "Treewidth+1";
	set ylabel "Running time (seconds)";
	set key on Left inside top right reverse box spacing 4;
	plot
	"< awk -v FS=' *; *' '{if($$2 == \"se\" && $$3 == \"12\" && index($$6, \"dimacs\")) print}' he.out" u 8:11 t "best heuristic" w p ls 3,
	"< awk -v FS=' *; *' '{if($$3 == \"7\" && index($$6, \"dimacs\")) print}' ex.out" u 8:11 t "best exact" w p ls 4

ex-contiki.ps: ex.out
	reset;
	set datafile separator ";";
	set title "Performance on contiki instances (Treewidth vs. Running time)";
	set terminal postscript color enhanced font 'Helvetica,14' eps;
#	set terminal wxt size 350,262 enhanced font 'Verdana,10' persist;
	set style line 1 lc rgb '#0060ad' pt 6 ps 1 lt 1 lw 1;
	set style line 2 lc rgb '#00AA00'     pt 2 ps 1 lt 1 lw 1;
	set style line 3 lc rgb 'red'    pt 4 ps 1 lt 1 lw 1;
	set style line 4 lc rgb 'blue'  pt 8 ps 1 lt 1 lw 1;
	set output '$@';
	set style line 11 lc rgb '#808080' lt 1;
	set border 3 back ls 11;
	set style line 12 lc rgb'#808080' lt 0 lw 1;
	set grid back ls 12;
	set xrange [0:60];
	set logscale y;
	set yrange [0.01:10000];
	set ytics 0.01,10;
	set mytics 1;
	set xlabel "Treewidth+1";
	set ylabel "Running time (seconds)";
	set key on Left inside top right reverse box spacing 4 width -2;
	plot
	"< awk -v FS=' *; *' '{if($$3 == \"0\" && index($$6, \"dimacs\")) print}' $<" u 8:11 t "Frankfurt University" w p ls 1,
	"< awk -v FS=' *; *' '{if($$3 == \"3\" && index($$6, \"dimacs\")) print}' $<" u 8:11 t "Utrecht University" w p ls 2,
	"< awk -v FS=' *; *' '{if($$3 == \"6\" && index($$6, \"dimacs\")) print}' $<" u 8:11 t "Luebeck University" w p ls 3,
	"< awk -v FS=' *; *' '{if($$3 == \"7\" && index($$6, \"dimacs\")) print}' $<" u 8:11 t "Meiji University" w p ls 4

he.ps: he.out
	reset;
	set datafile separator ";";
	set title "Performance of heuristic sequential submissions (Treewidth vs. Running time)";
	set terminal postscript color enhanced font 'Helvetica,14' eps;
#	set terminal wxt size 350,262 enhanced font 'Verdana,10' persist;
	set style line 1 lc rgb '#0060ad' pt 6 ps 1 lt 1 lw 1;
	set style line 2 lc rgb 'red'     pt 2 ps 1 lt 1 lw 1;
	set style line 3 lc rgb 'blue'    pt 4 ps 1 lt 1 lw 1;
	set style line 4 lc rgb 'violet'  pt 8 ps 1 lt 1 lw 1;
	set output '$@';
	set style line 11 lc rgb '#808080' lt 1;
	set border 3 back ls 11;
	set style line 12 lc rgb'#808080' lt 0 lw 1;
	set grid back ls 12;
#	set xrange [0:60];
	set logscale y;
	set yrange [0.01:10000];
	set ytics 0.01,10;
	set mytics 1;
	set xlabel "Treewidth+1";
	set ylabel "Running time (seconds)";
	set key on Left inside top right reverse box spacing 4 width -2;
	plot
	"< awk -v FS=' *; *' '{if($$3 == \"0\") print}' $<" u 8:11 t "freetdi/grtd"    w p ls 1,
	"< awk -v FS=' *; *' '{if($$3 ==\"12\") print}' $<" u 8:11 t "FlowCutter" w p ls 2,
	"< awk -v FS=' *; *' '{if($$3 == \"9\") print}' $<" u 8:11 t "Eli Fox"         w p ls 3,
	"< awk -v FS=' *; *' '{if($$3 == \"5\") print}' $<" u 8:11 t "htd/\n  treewidth-exact" w p ls 4

hehist.ps: he.out
	reset;
	set datafile separator ";";
	set title "Performance of heuristic sequential submissions (Treewidth vs. Running time)";
	set terminal postscript color enhanced font 'Helvetica,14' eps;
	set style line 1 lc rgb '#0060ad' pt 6 ps 1 lt 1 lw 1;
	set style line 2 lc rgb 'red'     pt 2 ps 1 lt 1 lw 1;
	set style line 3 lc rgb 'blue'    pt 4 ps 1 lt 1 lw 1;
	set style line 4 lc rgb 'violet'  pt 8 ps 1 lt 1 lw 1;
	set output 'hehist.ps';
	max=100.;
	min=0.;
	n=100;
	width=(max-min)/n;
	hist(x,width)=width*floor(x/width)+width/2.0;
	set style line 11 lc rgb '#808080' lt 1;
	set border 3 back ls 11;
	set style line 12 lc rgb'#808080' lt 0 lw 1;
	set grid back ls 12;
	set yrange [0:100];
	set xrange [0:100];
	set ytics 1,10;
	set mytics 1;
	set xlabel "Treewidth+1";
	set ylabel "frequency";
	set key on Left inside top right reverse box spacing 4 width -2;
	plot
	"< awk -v FS=' *; *' '{if($$3 == \"0\") print $$8}' he.out"
	   u (hist($$1,width)):(1.0) smooth freq lc rgb"green" t "0",
	"< awk -v FS=' *; *' '{if($$3 == \"12\") print $$8}' he.out"
	   u (hist($$1,width)):(1.0) smooth freq lc rgb"red" t "12",
	"< awk -v FS=' *; *' '{if($$3 == \"9\") print $$8}' he.out"
	   u (hist($$1,width)):(1.0) smooth freq lc rgb"blue" t "9",
	"< awk -v FS=' *; *' '{if($$3 == \"5\") print $$8}' he.out"
	   u (hist($$1,width)):(1.0) smooth freq lc rgb"purple" t "5"

data.out: ../logs/2016-08-13.02-08-25/all-results.csv
	-ln -s $< $@

ex.out: data.out Makefile
	grep '^ex; se' $< | grep -e "tw-exact" -e "BZTreewidth-DP.exe" > $@

he.out: data.out Makefile
	grep '^he; se' $< | grep -e 'he; se; 10' -e 'he; se; 1' -e 'he; se; 6' -e 'he; se; 12' -e 'he; se; 9;' -e 'grtd' -e "htd_gr2td_minfill_exhaustive" > $@

hepa.out: data.out Makefile
	grep -e 'he; pa; 12' -e 'he; pa; 2;' -e 'he; pa; 6;' -e 'grtd' $< > $@

#now it's getting ugly

%_hesestat.out: he.out
	awk -v FS=' *; *' '{if($$3 == "$*") DATA[$$8]++} END { for(BIN=0; BIN<=10000; BIN++) \
	    printf "%i %i \n", BIN, DATA[BIN], \
		 DATA[BIN+1] += DATA[BIN];} ' < he.out > $@

%_hepastat.out: hepa.out Makefile
	awk -v FS=' *; *' '{if($$3 == "$*") DATA[$$8]++} END { for(BIN=0; BIN<=1000; BIN++) \
	    printf "%i %i \n", BIN, DATA[BIN], \
		 DATA[BIN+1] += DATA[BIN];} ' < hepa.out > $@

%_hesestat.out: SHELL=/bin/sh
%_hesestat.out: .SHELLFLAGS=-c
%_hepastat.out: SHELL=/bin/sh
%_hepastat.out: .SHELLFLAGS=-c

hesestat.ps: 0_hesestat.out 5_hesestat.out 12_hesestat.out 9_hesestat.out 1_hesestat.out 6_hesestat.out 10_hesestat.out
	reset;
	set title "histogram integral (Treewidth counts)";
	set terminal postscript color enhanced font 'Helvetica,14' eps;
	set style line 1 lc rgb '#0060ad' pt 6 ps 1 lt 1 lw 1;
	set style line 2 lc rgb 'red'     pt 2 ps 1 lt 1 lw 1;
	set style line 3 lc rgb 'blue'    pt 4 ps 1 lt 1 lw 1;
	set style line 4 lc rgb 'violet'  pt 8 ps 1 lt 1 lw 1;
	set output '$@';
	set style line 11 lc rgb '#808080' lt 1;
	set border 3 back ls 11;
	set style line 12 lc rgb'#808080' lt 0 lw 1;
	set grid back ls 12;
	set xlabel "Treewidth+1";
	set logscale x;
	set ylabel "frequency (cumulative)";
	set key on Left inside bottom right reverse box spacing 4 width -2;
	set style data lines;
	plot
#	'0_hesestat.out' using 1:2 t "0",
	'12_hesestat.out' using 1:2 t "ben-strasser/flow-cutter-pace16",
	'9_hesestat.out' using 1:2 t "elitheeli/2016-pace-challenge",
	'5_hesestat.out' using 1:2 t "mabseher/htd",
	'10_hesestat.out' using 1:2 t "mfjones/pace2016",
	'6_hesestat.out' using 1:2 lc rgb"red" t "maxbannach/Jdrasil",
	'1_hesestat.out' using 1:2 lc rgb"blue" t "mrprajesh/pacechallenge"

hepastat.ps: 2_hepastat.out 6_hepastat.out 0_hepastat.out 12_hepastat.out
	reset;
	set title "histogram integral (Treewidth counts)";
	set terminal postscript color enhanced font 'Helvetica,14' eps;
	set style line 1 lc rgb '#0060ad' pt 6 ps 1 lt 1 lw 1;
	set style line 2 lc rgb 'red'     pt 2 ps 1 lt 1 lw 1;
	set style line 3 lc rgb 'blue'    pt 4 ps 1 lt 1 lw 1;
	set style line 4 lc rgb 'violet'  pt 8 ps 1 lt 1 lw 1;
	set output '$@';
	set style line 11 lc rgb '#808080' lt 1;
	set border 3 back ls 11;
	set style line 12 lc rgb'#808080' lt 0 lw 1;
	set grid back ls 12;
	set xlabel "Treewidth+1";
	set logscale x;
	set ylabel "frequency (cumulative)";
	set key on Left inside bottom right reverse box spacing 4;
	set style data lines;
	plot
#	'0_hepastat.out' using 1:2 t "0",
	'2_hepastat.out' using 1:2 t "willmlam/CVO2",
	'12_hepastat.out' using 1:2 t "ben-strasser/flow-cutter-pace16",
	'6_hepastat.out' using 1:2 lc rgb"red" t "maxbannach/Jdrasil";

hepa.out he.out ex.out: SHELL=/bin/sh
data.out: SHELL=/bin/sh
hepa.out he.out ex.out: .SHELLFLAGS=-c
data.out:.SHELLFLAGS=-c


$(PSPLOTS): SHELL=gnuplot
.ONESHELL: $(PSPLOTS)
$(PSPLOTS):.SHELLFLAGS=-e

