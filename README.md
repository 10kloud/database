# database
Database definitions for SiouxSilos project

This database contain User table, Alarm table, and Alarm history table.

E/R file it's in his Specify folder

Schema logico:

- user(id, mail, password, permission) PK: id
- alarm(id, user_id, name, description, threshold, severety_alarm, silos_id, alarming_parameter)PK:id FK:user_id
- alarm_history(alarm_id, data, resolved) PK:alarm_id FK: alarm_id