/**
 * _stubs.dm
 *
 * This file contains constructs that the process scheduler expects to exist
 * in a standard ss13 fork.
 */

/**
 * message_admins
 *
 * sends a message to admins
 */
/proc/message_admins(msg)
	world << msg

/**
 * logTheThing
 *
 * In goonstation, this proc writes a message to either the world log or diary.
 *
 * Blame Keelin.
 */
/proc/logTheThing(type, source, target, text, diaryType)
	if(diaryType)
		world << "Diary: \[[diaryType]:[type]] [text]"
	else
		world << "Log: \[[type]] [text]"

/**
 * var/disposed
 *
 * In goonstation, disposed is set to 1 after an object enters the delete queue
 * or the object is placed in an object pool (effectively out-of-play so to speak)
 */
/datum/var/disposed

/**
 * gameticker stub process -- in goonstation, the gameticker controls the round
 * and other round-related shit.
 */
/datum/controller/process/ticker/setup()
	name = "Ticker"
	schedule_interval = 5

/**
 * pregame
 *
 * gameticker stub -- your pregame should be called after all other processes are
 * intitialized and running.
 */
/datum/ticker/proc/pregame()

/**
 * var/global/ticker
 *
 * The ticker stub global instance
 */
/var/global/datum/ticker/ticker