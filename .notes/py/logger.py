path_log="/path/to/logs"

#logger creation
logger_predictions= logging.getLogger('name of the logger')
logger_predictions.setLevel('DEBUG')
filehandler_dbg = logging.FileHandler(path_log + logger_predictions.name + '-debug.log', mode='w')
logger_predictions.addHandler(filehandler_dbg)

#write logging
logger_times.info("init_model_load: %s" % millis())



