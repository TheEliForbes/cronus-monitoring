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

**Here is an example of a unit test configuration in the YAML file:**
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
**Things to Note about this unit test:**
  1. The "task_name" field is where you specify the TICK script that you wish to test
  2. Under data, "processes" is the name of the measurement and "blocked" is the column being used in the script logic to trigger an alert. 
  3. The "expects" section is where you assert what behavior the script should have when given the data above, in this case the test is expecting the script to return one warning.   
 **Here is the coorisponding test script:**
```
dbrp "telegraf"."autogen"
stream
	|from()
		.measurement('processes')
		.groupBy('host','blocked')
	//|window()
		//.period(1m)
		//.every(1m)
	|alert()
		.warn(lambda: "blocked" > 5)
		.message('warning: There is proccess blocking on Host: {{ index .Tags "host" }} ')
		//.slack()
		.stateChangesOnly()