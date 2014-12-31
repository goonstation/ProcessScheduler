/*
	These are simple defaults for your project.
 */
#define DEBUG

var/global/datum/processSchedulerView/processSchedulerView

world
	New()
		..()
		ticker = new
		processScheduler = new
		processSchedulerView = new

mob
	step_size = 8

	New()
		..()


	verb
		startProcessScheduler()
			set name = "Start Process Scheduler"
			processScheduler.setup()
			processScheduler.start()
			
		getProcessSchedulerContext()
			set name = "Get Process Scheduler Status Panel"
			processSchedulerView.getContext()

