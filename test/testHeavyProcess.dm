/**
 * testHeavyProcess
 * This process is an example of a simple update loop process that does tons of
 * processing, but each step is fast.
 */

/datum/controller/process/testHeavyProcess/setup()
	name = "Heavy Process"
	schedule_interval = 30 // every second

/datum/controller/process/testHeavyProcess/doWork()
	var/tmp/v
	for(var/i=0,i<10000000,i++) // Just to pretend we're doing something
		v = 1
		if (!(v == 1 && i % 1000)) // Don't scheck too damn much, because we're doing effectively nothing here.
			scheck()


