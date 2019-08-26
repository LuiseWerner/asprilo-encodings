# general structure
* **asg2**: RS-assignments, SP-assignments
* **asg3**: RSP-assignments

## Basics: asg computation
* **rsBasic**: generation of and constraints for RS-assignments
* **spBasic**: generation of and constraints for SP-assignments
* **rspBasic**: constraints for interaction of RS- and SP-assignments

## encodings: asg optimization
### distance based
* **once**: for each shelf distance to one station
* **double**: for each shelf (distance to one station)*2
* **allButOneDouble**: for each shelf ((distance to one station)*2) - (one SP-distance per robot)
* **mppOnce**: once with pickup and putdown included in sum
* **mppDouble**: double with pickup and putdown included in sum
* **mppAllButOneDouble**: allButOneDouble with pickup and putdown included in sum

### order batching based
* **obat3**: order batching option with priority 3
* **obat2**: order batching option with priority 2
* **obat1**: order batching option with priority 1

### others
* **SperR**: minimize shelves per robot

