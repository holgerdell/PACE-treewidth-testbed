# PACE 2016 - Tree width challenge

This repository contains all benchmark instances as well as a collection of tools with which the results of Track A of the 2016 [PACE challenge](https://pacechallenge.wordpress.com/) can be reproduced.

## Usage

Clone all submissions to PACE 2016 and check out the versions that were submitted:
```
make download
```

Compile all submissions:
```
make make
```

Run all submissions on all benchmark instances:
```
make run_pace16
```

## Instance sources

- [Named graphs](https://github.com/freetdi/named-graphs.git)
- [Control flow graphs](https://github.com/freetdi/CFGs.git)
- [DIMACS graph coloring](http://mat.gsia.cmu.edu/COLOR/instances.html)
- [Road graphs](https://github.com/ben-strasser/road-graphs-pace16)
- [Transit networks](https://github.com/daajoe/PACE2016_transit_graphs) (see also this [converter](https://github.com/daajoe/gtfs2graphs))

## Credits

- Holger Dell
- Felix Salfelder

## License

This project is licensed under GPLv3 - see the [LICENSE](LICENSE) file for details.
