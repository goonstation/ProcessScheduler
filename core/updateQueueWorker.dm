datum/updateQueueWorker
	var/tmp/list/objects
	var/tmp/killed
	var/tmp/finished
	var/tmp/procName
	var/tmp/list/arguments
	var/tmp/lastStart

datum/updateQueueWorker/New(var/list/objects, var/procName, var/list/arguments)
	..()
	uq_dbg("updateQueueWorker created.")
	
	src.objects = objects
	src.procName = procName
	src.arguments = arguments
	killed = 0
	finished = 0
	
datum/updateQueueWorker/proc/doWork()	
	// If there's nothing left to execute or we were killed, mark finished and return.		
	if (!objects.len) return finished()
	
	lastStart = world.time // Absolute number of ticks since the world started up
	
	var/datum/object = objects[objects.len] // Pull out the object
	objects.len-- // Remove the object from the list
	
	if (istype(object) && !object.disposed) // We only work with real objects
		call(object, procName)(arglist(arguments))

	// If there's nothing left to execute
	// or we were killed while running the above code, mark finished and return.
	if (!objects.len) return finished()
	spawn(0) // Execute anonymous function immediately as if we were in a while loop...
		doWork()
		
datum/updateQueueWorker/proc/finished()
	uq_dbg("updateQueueWorker finished.")
	/**
	 * If the worker was killed while it was working on something, it
	 * should delete itself when it finally finishes working on it.
	 * Meanwhile, the updateQueue will have proceeded on with the rest of
	 * the queue. This will also terminate the spawned function that was
	 * created in the kill() proc.
	 */
	if(killed)
		del(src)
		
	finished = 1
	
datum/updateQueueWorker/proc/kill()
	uq_dbg("updateQueueWorker killed.")
	killed = 1
	objects = new
	
	/**
	 * If the worker is not done in 30 seconds after it's killed,
	 * we'll forcibly delete it, causing the anonymous function it was
	 * running to be terminated. Hasta la vista, baby.
	 */
	spawn(300)
		del(src)
		
datum/updateQueueWorker/proc/start()
	uq_dbg("updateQueueWorker started.")
	spawn
		doWork()