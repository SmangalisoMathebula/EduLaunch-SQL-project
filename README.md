EduLaunch Database

This is the MySQL database for EduLaunch, a made-up platform that helps students get ready for work. Students enrol in short career programmes such as CV writing and mock interviews, complete activities, take assessments and download resources. I built it to practise relational database design in MySQL.

What is in it

The database has 11 tables:

students: account details, account status (Active, Expired or Blocked), expiry date and storage limits
careeradvisers: the staff who run the programmes and create resources
programmes: the courses on offer, with capacity and start and end dates
enrolments: which student is in which programme, plus their completion status and career readiness points
learningactivities: the workshops, assignments and sessions that make up each programme
studentprogress: a student's status and points for each activity
assessments: the tests attached to each programme
assessmentresults: each student's marks and career readiness score
digitalresources: downloadable material such as CV templates, videos and guides
resourcedownloads: a record of every download
systemevents: a log of problems, such as a blocked account trying to enrol or a student running out of storage

There are also four views for reporting:

vw_blockedaccounts: students whose accounts are blocked or expired
vw_popularprogrammes: programmes ranked by number of enrolments
vw_frequentlydownloadedresources: resources ranked by number of downloads
vw_topperformingstudents: students ranked by average marks, with their average readiness score

How the tables connect

A career adviser runs programmes and creates digital resources. A programme has many learning activities and assessments. Students are linked to programmes through the enrolments table, which has a unique key so a student cannot enrol in the same programme twice. Progress on activities hangs off an enrolment, and assessment results link a student to an assessment. Downloads link a student to a resource.

Setting it up

You need MySQL 8.0 or newer. The script uses features that do not work on MySQL 5.7 or MariaDB.

1. Create the database:

   CREATE DATABASE edulaunch;

2. Import the script:

   mysql -u root -p edulaunch < edulaunch.sql

If you get an error about GTID_PURGED, delete the line starting with SET @@GLOBAL.GTID_PURGED from the script and run it again. If the views fail to create, make sure you are importing as the root user.

Example queries

Blocked or expired accounts:

   SELECT * FROM vw_blockedaccounts;

Most popular programmes:

   SELECT * FROM vw_popularprogrammes;

Top performing students:

   SELECT * FROM vw_topperformingstudents;

Notes

All the data is made up. The password_hash values are placeholders and not real hashes.

AUTHOR

Smangaliso Mathebula
