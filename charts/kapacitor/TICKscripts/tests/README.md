# Kapacitor-Unit
## Getting Started
### Installation

 1. Navigate to the scripts folder in this repository
 2. Run the command `./initKapacitorUnit.sh`
 3. Next, export the path variable with this command: `export PATH=$PATH:/usr/local/go/bin`
 4. Kapacitor-Unit is now set up!
 
 ### Writing Unit Tests
There are two parts to writing unit tests with Kapacitor-Unit.
 first of all the framework takes a YAML file as an input with cofigurations for each test to be run.
 The other part is modifying a TICK script to be compatable with the framework. This is necessary because,
 being an open source project, Kapacitor-Unit only supports a specific format of TICK script.
 For example having a Window clause in the query will cause Kapacitor-Unit to not work correctly,
 so it needs to be commented out of the test version of a script.
 Here is an example of a unit test configuration in the YAML file:
```
 - name: "Spid Blocking Alert:: warning when blocking is recorded"
	task_name: spid_blocking_alert_tester.tick
	db: telegraf
	rp: autogen
	type: stream
	data:
		- processes blocked=0
		- processes blocked=6
	expects:
	ok: 0
	warn: 1
	crit: 0
```  