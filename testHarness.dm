/*
	These are simple defaults for your project.
 */
#define DEBUG

world

	New()
		..()
		ticker = new
		processScheduler = new

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
			processScheduler.getContext()

