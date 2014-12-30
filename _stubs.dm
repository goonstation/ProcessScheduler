/proc/message_admins(msg)
	world << msg

/proc/logTheThing(type, source, target, text, diaryType)
	if(diaryType)
		world << "Diary: \[[diaryType]:[type]] [text]"
	else
		world << "Log: \[[type]] [text]"

/datum/var/disposed

/datum/controller/process/ticker/setup()
	name = "Ticker"
	schedule_interval = 5

/datum/ticker/proc/pregame()

/var/global/datum/ticker/ticker

/proc/bootstrap_browse()
	usr << browse('bower_components/jquery/dist/jquery.min.js', "file=jquery.min.js;display=0")
	usr << browse('bower_components/bootstrap2.3.2/bootstrap/js/bootstrap.min.js', "file=bootstrap.min.js;display=0")
	usr << browse('bower_components/bootstrap2.3.2/bootstrap/css/bootstrap.min.css', "file=bootstrap.min.css;display=0")
	usr << browse('bower_components/bootstrap2.3.2/bootstrap/img/glyphicons-halflings-white.png', "file=glyphicons-halflings-white.png;display=0")
	usr << browse('bower_components/bootstrap2.3.2/bootstrap/img/glyphicons-halflings.png', "file=glyphicons-halflings.png;display=0")
	usr << browse('bower_components/json2/json2.js', "file=json2.js;display=0")
	
/proc/bootstrap_includes()
	return {"
	<link rel="stylesheet" href="bootstrap.min.css" />
	<script type="text/javascript" src="json2.js"></script>
	<script type="text/javascript" src="jquery.min.js"></script>
	<script type="text/javascript" src="bootstrap.js"></script>
	"}





