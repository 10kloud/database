# database
Database definitions for SiouxSilos project

This database contain User table, Alarm table, and Alarm history table(Alarm History still in progress).

E/R file it's in his Specify folder

Schema logico:

user(id, mail, password, permission)
alarm(id, user_id, threshold, severety_alarm, silos_id, alarming_parameter)
